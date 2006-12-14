/*

Adobe Systems Incorporated(r) Source Code License Agreement
Copyright(c) 2006 Adobe Systems Incorporated. All rights reserved.
	
Please read this Source Code License Agreement carefully before using
the source code.
	
Adobe Systems Incorporated grants to you a perpetual, worldwide, non-exclusive,
no-charge, royalty-free, irrevocable copyright license, to reproduce,
prepare derivative works of, publicly display, publicly perform, and
distribute this source code and such derivative works in source or
object code form without any attribution requirements.
	
The name "Adobe Systems Incorporated" must not be used to endorse or promote products
derived from the source code without prior written permission.
	
You agree to indemnify, hold harmless and defend Adobe Systems Incorporated from and
against any loss, damage, claims or lawsuits, including attorney's
fees that arise or result from your use or distribution of the source
code.
	
THIS SOURCE CODE IS PROVIDED "AS IS" AND "WITH ALL FAULTS", WITHOUT
ANY TECHNICAL SUPPORT OR ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING,
BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE ARE DISCLAIMED. ALSO, THERE IS NO WARRANTY OF
NON-INFRINGEMENT, TITLE OR QUIET ENJOYMENT. IN NO EVENT SHALL MACROMEDIA
OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOURCE CODE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package com.adobe.webapis.ebay.tests
{

import flexunit.framework.TestCase;
import com.adobe.webapis.ebay.events.EBayResultEvent;
import com.adobe.webapis.ebay.EBayService;
import com.adobe.webapis.ebay.AuthAndAuth;
import com.adobe.webapis.ebay.objects.*;
import com.adobe.webapis.ebay.results.*;
import com.adobe.webapis.ebay.codes.ErrorClassification;
import com.adobe.webapis.ebay.codes.Severity;
import com.adobe.webapis.ebay.codes.Currency;
import com.adobe.webapis.ebay.codes.Country;
import com.adobe.webapis.ebay.codes.ListingType;
import com.adobe.webapis.ebay.codes.ListingEnhancements;
import com.adobe.webapis.ebay.codes.ShippingType;

/**
 * Unit tests for the EBayService.  This is a particularly tricky class
 * to test.  We want to automate testing to ensure that the service responds
 * properly and that we can handle the resulting XML packet.  Unfortunately, to test
 * for success we need to use valid parameters, which we don't always have.  For
 * example, to test removing an item, we need to add an item first, which means
 * we need a valid item id, but item id's expire so if we use one id for testing
 * for success, it might be invalid in a month and will erroneously cause the
 * test to fail.  Overall, this approach becomes more tedious than it needs to be.
 * 
 * So, these test are here to make sure that at least the proper event handlers
 * are being invoked, and to make sure that the failure messages are being
 * processed correctly.  We can always verify that a method fails when called
 * with incorrect parameters, so that is the approach we take here.
 * 
 * To test the parsing of successful results, see the EBayResultParserTest class.
 * 
 * @see EBayResultParserTest
 */
public class EBayServiceTest extends TestCase
{
	
	private const CALL_TIMEOUT:int = 10000;
	
	private var service:EBayService;
	
	// =======================================================
	// 	You must set your api key values first before running
	// 	these tests!
	// =======================================================
	public static var DEV_NAME:String = "";
	public static var APP_NAME:String = "";
	public static var CERT_NAME:String = "";
	public static var AUTH_TOKEN:String = "";
	public static var END_USER_IP:String = "";

	/**
	 * Constructor
	 */
	public function EBayServiceTest( methodName:String = null )
	{
		super( methodName );
	}
	
	/**
	 * Before every method, configure the api keys and the service
	 */
	override public function setUp():void
	{
		AuthAndAuth.apiDevName = DEV_NAME;
		AuthAndAuth.apiAppName = APP_NAME;
		AuthAndAuth.apiCertName = CERT_NAME;
		AuthAndAuth.apiAuthToken = AUTH_TOKEN;
		AuthAndAuth.endUserIP = END_USER_IP;
		
		// Create a new service every time so the old one that already has
		// listeners defined on it will get garbaged collected
		service = new EBayService();
	}
	
	// ====================================================
	//	getSearchResults() tests
	// ====================================================
	
	/**
	 * Test the getSearchResults() eBay method for failure
	 */
	public function testGetSearchResultsFailure():void
	{
		service.addEventListener( EBayResultEvent.ON_GET_SEARCH_RESULTS, 
								  addAsync( onGetSearchResultsFailure, CALL_TIMEOUT ), false, 0, true );
		
		// Cause a failure by not specifying a query
		service.getSearchResults( "" );
	}
	
	/**
	 * Helper function for testGetSearchResultsFailure().  Verify that the data from
	 * the server was parsed correctly.
	 */
	private function onGetSearchResultsFailure( event:EBayResultEvent ):void
	{
		var result:SearchResults = SearchResults( event.data );
		
		assertEquals( "Failure", result.ack );
		for each ( var error:EBayError in result.errors )
		{
			assertEquals( ErrorClassification.REQUEST_ERROR, error.errorClassification );
			assertTrue( error.errorCode.length > 0 );
			assertTrue( error.longMessage.length > 0 );
			assertTrue( error.shortMessage.length > 0 );
			assertEquals( Severity.ERROR, error.severityCode );
			
			assertNotNull( error.errorParameters );
			assertEquals( 0, error.errorParameters.length );
		}
	}
	
	// ====================================================
	//	removeFromWatchList() tests
	// ====================================================

	/**
	 * Test the removeFromWatchList() eBay method for failure
	 */
	public function testRemoveFromWatchListFailure():void
	{
		service.addEventListener( EBayResultEvent.ON_REMOVE_FROM_WATCH_LIST, 
								  addAsync( onRemoveFromWatchListFailure, CALL_TIMEOUT ), false, 0, true );
		
		// Pass an invalid id that isn't in the watch list to generate an error
		service.removeFromWatchList( "123" );
	}
	
	/**
	 * Helper function for testRemoveFromWatchListFailure().  Verify that the data from
	 * the server was parsed correctly.
	 */
	private function onRemoveFromWatchListFailure( event:EBayResultEvent ):void
	{
		var result:AddOrRemoveFromWatchListResult = AddOrRemoveFromWatchListResult( event.data );
		
		assertEquals( "Failure", result.ack );
		assertNotNull( result.errors );
		assertEquals( 2, result.errors.length );
		
		// First error is a warning
		var error:EBayError = result.errors[0];
		assertEquals( ErrorClassification.REQUEST_ERROR, error.errorClassification );
		assertEquals( "21002", error.errorCode );
		assertTrue( error.longMessage.length > 0 );
		assertTrue( error.shortMessage.length > 0 );
		assertEquals( Severity.WARNING, error.severityCode );
		
		// Second error is an error
		error = result.errors[1];
		assertEquals( ErrorClassification.REQUEST_ERROR, error.errorClassification );
		assertEquals( "20820", error.errorCode );
		assertTrue( error.longMessage.length > 0 );
		assertTrue( error.shortMessage.length > 0 );
		assertEquals( Severity.ERROR, error.severityCode );
	}
	
	// ====================================================
	//	addToWatchList() tests
	// ====================================================
	
	/**
	 * Test the addToWatchList() eBay method for failure
	 */
	public function testAddToWatchListFailure():void
	{
		service.addEventListener( EBayResultEvent.ON_ADD_TO_WATCH_LIST, 
								  addAsync( onAddToWatchListFailure, CALL_TIMEOUT ), false, 0, true );
		
		service.addToWatchList( "" );
	}
	
	/**
	 * Helper function for testAddToWatchListFailure().  Verify that the data from
	 * the server was parsed correctly.
	 */
	private function onAddToWatchListFailure( event:EBayResultEvent ):void
	{
		var result:AddOrRemoveFromWatchListResult = AddOrRemoveFromWatchListResult( event.data );
		
		assertEquals( "Failure", result.ack );
		
		for each ( var error:EBayError in result.errors )
		{
			assertEquals( ErrorClassification.REQUEST_ERROR, error.errorClassification );
			assertTrue( error.errorCode.length > 0 );
			assertTrue( error.longMessage.length > 0 );
			assertTrue( error.shortMessage.length > 0 );
			assertEquals( Severity.ERROR, error.severityCode );
			
			// The error was generated because we passed an invalid item id -- so make
			// sure that's the correct value we get back.
			assertTrue( error.errorParameters.length > 0 );
			assertEquals( "ItemID", ErrorParameter( error.errorParameters[ 0 ] ).value );
		}
	}
	
	// ====================================================
	//	getItem() tests
	// ====================================================
	
	/**
	 * Test the getItem() eBay method for failure
	 */
	public function testGetItemFailure():void
	{
		service.addEventListener( EBayResultEvent.ON_GET_ITEM, 
								  addAsync( onGetItemFailure, CALL_TIMEOUT ), false, 0, true );
		service.getItem( "" );
	}
	
	/**
	 * Helper function for testGetItemFailure().  Verify that the data from
	 * the server was parsed correctly.
	 */
	private function onGetItemFailure( event:EBayResultEvent ):void
	{
		var item:EBayItem = EBayItem( event.data );

		assertEquals( "Failure", item.ack );
	}

	// ====================================================
	//	getMyeBayBuying() tests
	// ====================================================
	
	/**
	 * Test the getMyeBayBuying() eBay method for failure
	 */
	public function testGetMyEBayBuyingFailure():void
	{
		service.addEventListener( EBayResultEvent.ON_GET_MY_EBAY_BUYING, 
								  addAsync( onGetMyEBayBuyingFailure, CALL_TIMEOUT ), false, 0, true );
		
		service.getMyEBayBuying();
	}
	
	/**
	 * Helper function for testGetMyEBayBuyingFailure().  Verify that the data from
	 * the server was parsed correctly.
	 */
	private function onGetMyEBayBuyingFailure( event:EBayResultEvent ):void
	{
		var items:MyEBayBuyingItems = MyEBayBuyingItems( event.data );
		
		assertEquals( "Failure", items.ack );
	}

	// ====================================================
	//	placeOffer() tests
	// ====================================================

	/**
	 * Test the placeOffer() eBay method for failure
	 */
	public function testPlaceOfferFailure():void
	{
		service.addEventListener( EBayResultEvent.ON_PLACE_OFFER, 
								  addAsync( onPlaceOfferFailure, CALL_TIMEOUT ), false, 0, true );
		service.placeOffer( "", "1" );
	}
	
	/**
	 * Helper function for testPlaceOfferFailure().  Verify that the data from
	 * the server was parsed correctly.
	 */
	private function onPlaceOfferFailure( event:EBayResultEvent ):void
	{
		var result:PlaceOfferResult = PlaceOfferResult( event.data );

		assertEquals( "Failure", result.ack );
	}
	
	// ====================================================
	//	getUser() tests
	// ====================================================
	
	/**
	 * Test the getUser() eBay method for failure
	 */
	public function testGetUserFailure():void
	{
		service.addEventListener( EBayResultEvent.ON_GET_USER, 
								  addAsync( onGetUserFailure, CALL_TIMEOUT ), false, 0, true );
		service.getUser( "" );
	}
	
	/**
	 * Helper function for testGetUserFailure().  Verify that the data from
	 * the server was parsed correctly.
	 */
	private function onGetUserFailure( event:EBayResultEvent ):void
	{
		var user:EBayUser = EBayUser( event.data );
		
		assertEquals( "Failure", user.ack );
	}
	
} // end class
} // end package