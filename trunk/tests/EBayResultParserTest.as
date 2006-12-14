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

import com.adobe.webapis.ebay.*;
import com.adobe.webapis.ebay.codes.*;
import com.adobe.webapis.ebay.objects.*;
import com.adobe.webapis.ebay.results.*;

import flexunit.framework.TestCase;

/** Use the EBay internal namespace to access the result parser */
use namespace ebay_internal;

/**
 * Test the parse methods in the EBayResultParser class.  This allows us
 * verify that the XML being returned from the EBay API can be successful
 * parsed into the objects that we've created.
 * 
 * Sample XML results of successfuls API calls are stored as private variables,
 * and then the parse methods are run against those XML results to verify that
 * everything is being parsed correctly.  This is done because it's very tricky
 * to guarantee successful call results in an automated fashion in the 
 * EBayServiceTest class.
 */
public class EBayResultParserTest extends TestCase
{
	/** A sample response from a successful call of the EBay GetSearchResults method */
	private var getSearchResultsResponse:XML = new XML( '<GetSearchResultsResponse xmlns="urn:ebay:apis:eBLBaseComponents"><Timestamp>2006-12-02T19:05:11.590Z</Timestamp><Ack>Success</Ack><Version>487</Version><Build>e487_core_Bundled_3843203_R1</Build><SearchResultItemArray><SearchResultItem><Item><ItemID>110011443876</ItemID><ListingDetails><StartTime>2006-11-29T18:47:40.000Z</StartTime><EndTime>2006-12-04T18:47:40.000Z</EndTime><ViewItemURL>http://cgi.sandbox.ebay.com/ws/eBayISAPI.dll?ViewItem&amp;item=110011443876&amp;ih=001&amp;category=49033&amp;ssPageName=WDVW&amp;rd=1</ViewItemURL></ListingDetails><SellingStatus><BidCount>0</BidCount><CurrentPrice currencyID="USD">1.0</CurrentPrice></SellingStatus><Site>US</Site><Title>Sony RM-AV2500 [SONRMAV2500] Remote Control RMAV2500</Title><BuyItNowPrice currencyID="USD">50.0</BuyItNowPrice><Currency>USD</Currency><ListingType>Chinese</ListingType><GiftIcon>0</GiftIcon><SubTitle></SubTitle><Country>US</Country><ShippingDetails><ShippingType>NotSpecified</ShippingType></ShippingDetails><SearchDetails><BuyItNowEnabled>true</BuyItNowEnabled></SearchDetails><PictureDetails><GalleryType>None</GalleryType></PictureDetails><ListingDuration>Days_5</ListingDuration></Item></SearchResultItem><SearchResultItem><Item><ItemID>110011443888</ItemID><ListingDetails><StartTime>2006-11-29T18:47:43.000Z</StartTime><EndTime>2006-12-04T18:47:43.000Z</EndTime><ViewItemURL>http://cgi.sandbox.ebay.com/ws/eBayISAPI.dll?ViewItem&amp;item=110011443888&amp;ih=001&amp;category=66962&amp;ssPageName=WDVW&amp;rd=1</ViewItemURL></ListingDetails><SellingStatus><BidCount>0</BidCount><CurrentPrice currencyID="USD">1.0</CurrentPrice></SellingStatus><Site>US</Site><Title>SONY DCR-VX2000, DCR-VX2100 RAPID CHARGER</Title><BuyItNowPrice currencyID="USD">50.0</BuyItNowPrice><Currency>USD</Currency><ListingType>Chinese</ListingType><GiftIcon>0</GiftIcon><SubTitle></SubTitle><Country>US</Country><ShippingDetails><ShippingType>NotSpecified</ShippingType></ShippingDetails><SearchDetails><BuyItNowEnabled>true</BuyItNowEnabled></SearchDetails><PictureDetails><GalleryType>None</GalleryType></PictureDetails><ListingDuration>Days_5</ListingDuration></Item></SearchResultItem><SearchResultItem><Item><ItemID>110011260971</ItemID><ListingDetails><StartTime>2006-11-28T06:24:21.000Z</StartTime><EndTime>2006-12-05T06:24:21.000Z</EndTime><ViewItemURL>http://cgi.sandbox.ebay.com/ws/eBayISAPI.dll?ViewItem&amp;item=110011260971&amp;ih=001&amp;category=11862&amp;ssPageName=WDVW&amp;rd=1</ViewItemURL></ListingDetails><SellingStatus><BidCount>0</BidCount><CurrentPrice currencyID="CAD">10.0</CurrentPrice><ConvertedCurrentPrice currencyID="USD">8.76</ConvertedCurrentPrice></SellingStatus><Site>Canada</Site><Title>Replacement for SONY </Title><Currency>CAD</Currency><ListingType>FixedPriceItem</ListingType><GiftIcon>0</GiftIcon><SubTitle></SubTitle><PaymentMethods>PayPal</PaymentMethods><Country>US</Country><Storefront><StoreCategoryID>0</StoreCategoryID><StoreCategory2ID>0</StoreCategory2ID><StoreURL>http://stores.sandbox.ebay.com/id=500047</StoreURL><StoreName>ca_additem21</StoreName></Storefront><ShippingDetails><ShippingType>Flat</ShippingType><DefaultShippingCost currencyID="CAD">12.0</DefaultShippingCost></ShippingDetails><PictureDetails><GalleryType>Gallery</GalleryType><GalleryURL>http://thumbs.ebay.com/pict/110011260971.jpg</GalleryURL></PictureDetails><ListingDuration>Days_7</ListingDuration></Item><SearchResultValues>Picture</SearchResultValues></SearchResultItem><SearchResultItem><Item><ItemID>110011528562</ItemID><ListingDetails><StartTime>2006-12-01T07:04:13.000Z</StartTime><EndTime>2006-12-08T07:04:13.000Z</EndTime><ViewItemURL>http://cgi.sandbox.ebay.com/ws/eBayISAPI.dll?ViewItem&amp;item=110011528562&amp;ih=001&amp;category=11862&amp;ssPageName=WDVW&amp;rd=1</ViewItemURL></ListingDetails><SellingStatus><BidCount>0</BidCount><CurrentPrice currencyID="CAD">100.0</CurrentPrice><ConvertedCurrentPrice currencyID="USD">87.62</ConvertedCurrentPrice></SellingStatus><Site>Canada</Site><Title>Replacement for SONY PCGA-BP51, </Title><Currency>CAD</Currency><ListingType>FixedPriceItem</ListingType><GiftIcon>0</GiftIcon><SubTitle></SubTitle><PaymentMethods>PayPal</PaymentMethods><Country>US</Country><Storefront><StoreCategoryID>0</StoreCategoryID><StoreCategory2ID>0</StoreCategory2ID><StoreURL>http://stores.sandbox.ebay.com/id=500047</StoreURL><StoreName>ca_additem21</StoreName></Storefront><ShippingDetails><ShippingType>Flat</ShippingType><DefaultShippingCost currencyID="CAD">12.0</DefaultShippingCost></ShippingDetails><PictureDetails><GalleryType>Gallery</GalleryType><GalleryURL>http://thumbs.ebay.com/pict/110011528562.jpg</GalleryURL></PictureDetails><ListingDuration>Days_7</ListingDuration></Item><SearchResultValues>Picture</SearchResultValues></SearchResultItem><SearchResultItem><Item><ItemID>110011528730</ItemID><ListingDetails><StartTime>2006-12-01T07:07:17.000Z</StartTime><EndTime>2006-12-08T07:07:17.000Z</EndTime><ViewItemURL>http://cgi.sandbox.ebay.com/ws/eBayISAPI.dll?ViewItem&amp;item=110011528730&amp;ih=001&amp;category=11862&amp;ssPageName=WDVW&amp;rd=1</ViewItemURL></ListingDetails><SellingStatus><BidCount>0</BidCount><CurrentPrice currencyID="CAD">10.0</CurrentPrice><ConvertedCurrentPrice currencyID="USD">8.76</ConvertedCurrentPrice></SellingStatus><Site>Canada</Site><Title>Replacement for SONY PCGA-BP51,</Title><Currency>CAD</Currency><ListingType>FixedPriceItem</ListingType><GiftIcon>0</GiftIcon><SubTitle></SubTitle><PaymentMethods>PayPal</PaymentMethods><Country>US</Country><Storefront><StoreCategoryID>0</StoreCategoryID><StoreCategory2ID>0</StoreCategory2ID><StoreURL>http://stores.sandbox.ebay.com/id=500047</StoreURL><StoreName>ca_additem21</StoreName></Storefront><ShippingDetails><ShippingType>Flat</ShippingType><DefaultShippingCost currencyID="CAD">12.0</DefaultShippingCost></ShippingDetails><PictureDetails><GalleryType>Gallery</GalleryType><GalleryURL>http://thumbs.ebay.com/pict/110011528730.jpg</GalleryURL></PictureDetails><ListingDuration>Days_7</ListingDuration></Item><SearchResultValues>Picture</SearchResultValues></SearchResultItem><SearchResultItem><Item><ItemID>110011541226</ItemID><ListingDetails><StartTime>2006-12-01T14:34:46.000Z</StartTime><EndTime>2006-12-08T14:34:46.000Z</EndTime><ViewItemURL>http://cgi.sandbox.ebay.com/ws/eBayISAPI.dll?ViewItem&amp;item=110011541226&amp;ih=001&amp;category=32867&amp;ssPageName=WDVW&amp;rd=1</ViewItemURL></ListingDetails><SellingStatus><BidCount>0</BidCount><CurrentPrice currencyID="USD">339.9</CurrentPrice></SellingStatus><Site>US</Site><Title>Sony DSCL-1 Compact Digital Camera 3X Zoom, Carl&apos;s Lens</Title><Currency>USD</Currency><ListingType>Chinese</ListingType><GiftIcon>0</GiftIcon><SubTitle></SubTitle><Country>US</Country><ShippingDetails><ShippingType>NotSpecified</ShippingType></ShippingDetails><SearchDetails><BuyItNowEnabled>false</BuyItNowEnabled></SearchDetails><PictureDetails><GalleryType>None</GalleryType></PictureDetails><ListingDuration>Days_7</ListingDuration></Item><SearchResultValues>Picture</SearchResultValues></SearchResultItem><SearchResultItem><Item><ItemID>110011541644</ItemID><ListingDetails><StartTime>2006-12-01T14:41:14.000Z</StartTime><EndTime>2006-12-08T14:41:14.000Z</EndTime><ViewItemURL>http://cgi.sandbox.ebay.com/ws/eBayISAPI.dll?ViewItem&amp;item=110011541644&amp;ih=001&amp;category=107898&amp;ssPageName=WDVW&amp;rd=1</ViewItemURL></ListingDetails><SellingStatus><BidCount>0</BidCount><CurrentPrice currencyID="USD">340.0</CurrentPrice></SellingStatus><Site>US</Site><Title>Sony Cybershot DSCT33 5.1MP Digital Camera with 3x Opti</Title><Currency>USD</Currency><ListingType>Chinese</ListingType><GiftIcon>0</GiftIcon><SubTitle></SubTitle><Country>US</Country><ShippingDetails><ShippingType>NotSpecified</ShippingType></ShippingDetails><SearchDetails><BuyItNowEnabled>false</BuyItNowEnabled></SearchDetails><PictureDetails><GalleryType>None</GalleryType></PictureDetails><ListingDuration>Days_7</ListingDuration></Item><SearchResultValues>Picture</SearchResultValues></SearchResultItem></SearchResultItemArray><ItemsPerPage>100</ItemsPerPage><PageNumber>1</PageNumber><HasMoreItems>false</HasMoreItems><PaginationResult><TotalNumberOfPages>1</TotalNumberOfPages><TotalNumberOfEntries>7</TotalNumberOfEntries></PaginationResult><CategoryArray/></GetSearchResultsResponse>' );
	
	/** A sample response from a successful call of the EBay AddToWatchList method */
	private var addToWatchListResponse:XML = new XML( '<AddToWatchListResponse xmlns="urn:ebay:apis:eBLBaseComponents"><Timestamp>2006-12-02T20:35:24.485Z</Timestamp><Ack>Success</Ack><Version>489</Version><Build>e489_core_Bundled_3911334_R1</Build><WatchListCount>1</WatchListCount><WatchListMaximum>100</WatchListMaximum></AddToWatchListResponse>' );
	
	/** A sample response from a successful call of the EBay RemoveFromWatchList method */
	private var removeFromWatchListResponse:XML = new XML( '<RemoveFromWatchListResponse xmlns="urn:ebay:apis:eBLBaseComponents"><Timestamp>2006-12-02T20:37:00.096Z</Timestamp><Ack>Success</Ack><Version>489</Version><Build>e489_core_Bundled_3911334_R1</Build><WatchListCount>0</WatchListCount><WatchListMaximum>100</WatchListMaximum></RemoveFromWatchListResponse>' );
	
	/** A sample response from a successful call of the EBay GetItem method */
	private var getItemResponse:XML = new XML( '<GetItemResponse xmlns="urn:ebay:apis:eBLBaseComponents"><Timestamp>2006-12-03T20:10:42.572Z</Timestamp><Ack>Success</Ack><Version>489</Version><Build>e489_core_Bundled_3911334_R1</Build><Item><AutoPay>false</AutoPay><BuyerProtection>ItemIneligible</BuyerProtection><BuyItNowPrice currencyID="USD">50.0</BuyItNowPrice><Country>US</Country><Currency>USD</Currency><Description>SONY DCR-VX2000, DCR-VX2100 RAPID CHARGER - Description&lt;p /&gt;&lt;hr/&gt;&lt;span class=&quot;ebay&quot;&gt;On Nov-29-06 at 10:48:16 PST, seller added the following information:&lt;/span&gt;&lt;p /&gt;&lt;!-- bf57590668624483a5876c9603886e80 --&gt;&lt;center&gt;&lt;div style=&quot;FONT-FAMILY: Arial,SunSans-Regular,sans-serif; TEXT-ALIGN: center; size: 3&quot;&gt;Canadian buyers:&amp;nbsp;&lt;a href=&quot;http://localhost/clearpath/buyer/estimate/getItem.do&quot;&gt;&lt;strong&gt;Calculate Shipping&lt;/strong&gt;&lt;span style=&quot;COLOR: black; TEXT-DECORATION: none&quot;&gt;&amp;nbsp;|&amp;nbsp;&lt;/span&gt;&lt;strong&gt;CHECKOUT NOW&lt;/strong&gt;&lt;/a&gt;&lt;br/&gt;&lt;br/&gt;&lt;img src=&quot;http://www.pbclearpath.com/images/CP_banner_logo.gif&quot; alt=&quot;ClearPath Cross-Border Service&quot; border=&quot;0&quot; /&gt;&lt;/div&gt;&lt;/center&gt;</Description><GiftIcon>0</GiftIcon><HitCounter>NoHitCounter</HitCounter><ItemID>110011443888</ItemID><ListingDetails><Adult>false</Adult><BindingAuction>false</BindingAuction><CheckoutEnabled>true</CheckoutEnabled><ConvertedBuyItNowPrice currencyID="USD">50.0</ConvertedBuyItNowPrice><ConvertedStartPrice currencyID="USD">1.0</ConvertedStartPrice><HasReservePrice>false</HasReservePrice><StartTime>2006-11-29T18:47:43.000Z</StartTime><EndTime>2006-12-04T18:47:43.000Z</EndTime><ViewItemURL>http://cgi.sandbox.ebay.com/ws/eBayISAPI.dll?ViewItem&amp;item=110011443888&amp;category=66962</ViewItemURL><HasUnansweredQuestions>false</HasUnansweredQuestions><HasPublicMessages>false</HasPublicMessages><ExpressListing>false</ExpressListing></ListingDetails><ListingDesigner><LayoutID>10000</LayoutID><ThemeID>10</ThemeID></ListingDesigner><ListingDuration>Days_5</ListingDuration><ListingType>Chinese</ListingType><Location>San Jose, CA</Location><PaymentMethods>PaymentSeeDescription</PaymentMethods><PaymentMethods>VisaMC</PaymentMethods><PrimaryCategory><CategoryID>66962</CategoryID><CategoryName>Business &amp; Industrial:Industrial Supply, MRO:Cleaning &amp; Painting:Cleaning Equipment &amp; Supplies:Carpet Cleaning &amp; Care:Other Carpet Cleaning &amp; Care</CategoryName></PrimaryCategory><PrivateListing>false</PrivateListing><Quantity>1</Quantity><ReviseStatus><ItemRevised>false</ItemRevised></ReviseStatus><Seller><AboutMePage>false</AboutMePage><Email>Invalid Request</Email><FeedbackScore>1</FeedbackScore><FeedbackPrivate>false</FeedbackPrivate><FeedbackRatingStar>None</FeedbackRatingStar><IDVerified>true</IDVerified><eBayGoodStanding>true</eBayGoodStanding><NewUser>false</NewUser><RegistrationDate>2003-07-21T17:06:11.000Z</RegistrationDate><Site>US</Site><Status>Confirmed</Status><UserID>anistor1</UserID><UserIDChanged>false</UserIDChanged><UserIDLastChanged>2003-07-21T17:06:18.000Z</UserIDLastChanged><VATStatus>NoVATTax</VATStatus><SellerInfo><AllowPaymentEdit>true</AllowPaymentEdit><CheckoutEnabled>true</CheckoutEnabled><CIPBankAccountStored>false</CIPBankAccountStored><GoodStanding>true</GoodStanding><LiveAuctionAuthorized>false</LiveAuctionAuthorized><MerchandizingPref>OptIn</MerchandizingPref><QualifiesForB2BVAT>false</QualifiesForB2BVAT><SellerLevel>None</SellerLevel><StoreOwner>false</StoreOwner><ExpressEligible>false</ExpressEligible><ExpressWallet>false</ExpressWallet></SellerInfo><MotorsDealer>false</MotorsDealer></Seller><SellingStatus><BidCount>0</BidCount><BidIncrement currencyID="USD">0.25</BidIncrement><ConvertedCurrentPrice currencyID="USD">1.0</ConvertedCurrentPrice><CurrentPrice currencyID="USD">1.0</CurrentPrice><MinimumToBid currencyID="USD">1.0</MinimumToBid><QuantitySold>0</QuantitySold><ReserveMet>true</ReserveMet><SecondChanceEligible>false</SecondChanceEligible><ListingStatus>Active</ListingStatus></SellingStatus><ShippingDetails><AllowPaymentEdit>true</AllowPaymentEdit><ApplyShippingDiscount>false</ApplyShippingDiscount><InsuranceOption>NotOffered</InsuranceOption><SalesTax><SalesTaxPercent>0.0</SalesTaxPercent><ShippingIncludedInTax>false</ShippingIncludedInTax></SalesTax><ThirdPartyCheckout>false</ThirdPartyCheckout><TaxTable/></ShippingDetails><ShipToLocations>US</ShipToLocations><Site>US</Site><StartPrice currencyID="USD">1.0</StartPrice><TimeLeft>PT22H37M1S</TimeLeft><Title>SONY DCR-VX2000, DCR-VX2100 RAPID CHARGER</Title><HitCount>0</HitCount><GetItFast>false</GetItFast><PostalCode></PostalCode><PictureDetails><PhotoDisplay>None</PhotoDisplay></PictureDetails><ProxyItem>false</ProxyItem></Item></GetItemResponse>' );
	
	/** A sample response from a successful call of the EBay GetMyEBayBuying method */
	private var getMyEBayBuyingItemsResponse:XML = new XML( '' );
	
	/** A sample response from a successful call of the EBay GetUser method */
	private var getUserResponse:XML = new XML( '<GetUserResponse xmlns="urn:ebay:apis:eBLBaseComponents"><Timestamp>2006-12-03T20:32:31.488Z</Timestamp><Ack>Success</Ack><Version>489</Version><Build>e489_core_Bundled_3911334_R1</Build><User><AboutMePage>true</AboutMePage><EIASToken>nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wJnY+lD5aBoQ2dj6x9nY+seQ==</EIASToken><Email>Invalid Request</Email><FeedbackScore>99</FeedbackScore><UniqueNegativeFeedbackCount>-1</UniqueNegativeFeedbackCount><UniquePositiveFeedbackCount>-1</UniquePositiveFeedbackCount><PositiveFeedbackPercent>0.0</PositiveFeedbackPercent><FeedbackPrivate>false</FeedbackPrivate><FeedbackRatingStar>Blue</FeedbackRatingStar><IDVerified>true</IDVerified><eBayGoodStanding>true</eBayGoodStanding><NewUser>false</NewUser><RegistrationDate>2006-01-01T18:59:59.000Z</RegistrationDate><Site>US</Site><Status>Confirmed</Status><UserID>dunnproducts_com</UserID><UserIDChanged>false</UserIDChanged><UserIDLastChanged>2006-05-02T01:58:28.000Z</UserIDLastChanged><VATStatus>NoVATTax</VATStatus><SellerInfo><AllowPaymentEdit>true</AllowPaymentEdit><CheckoutEnabled>true</CheckoutEnabled><CIPBankAccountStored>false</CIPBankAccountStored><GoodStanding>true</GoodStanding><LiveAuctionAuthorized>false</LiveAuctionAuthorized><MerchandizingPref>OptIn</MerchandizingPref><QualifiesForB2BVAT>false</QualifiesForB2BVAT><SellerGuaranteeLevel>NotEligible</SellerGuaranteeLevel><SellerLevel>None</SellerLevel><SchedulingInfo><MaxScheduledMinutes>30240</MaxScheduledMinutes><MinScheduledMinutes>0</MinScheduledMinutes><MaxScheduledItems>3000</MaxScheduledItems></SchedulingInfo><StoreOwner>false</StoreOwner><ExpressEligible>false</ExpressEligible><ExpressWallet>false</ExpressWallet><CharityRegistered>false</CharityRegistered></SellerInfo><eBayWikiReadOnly>true</eBayWikiReadOnly><MotorsDealer>false</MotorsDealer></User></GetUserResponse>' );
	
	/** A sample response from a successful call of the EBay PlaceOffer method */
	private var placeOfferResult:XML = new XML( '' );
	
	/**
	 * Constructor
	 */
	public function EBayResultParserTest( methodName:String = null )
	{
		super( methodName );
	}
	
	/**
	 * Test that parseSearchResults operates successfully.
	 */
	public function testParseSearchResults():void
	{
		var result:SearchResults = EBayResultParser.parseSearchResults( getSearchResultsResponse );
		
		assertEquals( "Success", result.ack );
		
		// Test top level properties that are returned
		assertEquals( 100, result.itemsPerPage );
		assertEquals( 1, result.pageNumber );
		assertFalse( result.hasMoreItems );
		assertNull( result.spellingSuggestion );
		
		// Test the pagination result value
		assertNotNull( result.paginationResult );
		assertEquals( 7, result.paginationResult.totalNumberOfEntries );
		assertEquals( 1, result.paginationResult.totalNumberOfPages );
		
		// Test that the items are populated correctly
		assertNotNull( result.searchResultItems );
		for each ( var resultItem:SearchResultItem in result.searchResultItems )
		{
			var item:Item = resultItem.item;
			// The the basic properties of the item
			assertTrue( item.itemID.length > 0 );
			assertEquals( 3, item.currency.length );
			assertEquals( 2, item.country.length );
			//assertEquals( Currency.USD, item.currency );
			//assertEquals( Country.US, item.country );
			assertTrue( item.title.length > 0 );
			assertTrue( item.buyItNowPrice >= 0 );
			//assertEquals( ListingType.CHINESE, item.listingType );
			assertTrue( item.listingType.length > 0 );
			
			assertNotNull( item.listingEnhancement );
			assertTrue( item.listingEnhancement.length >= 0 );
			//assertEquals( ListingEnhancements.BOLD_TITLE, item.listingEnhancement[0] );
			
			assertNotNull( item.paymentMethods );
			assertTrue( item.paymentMethods.length >= 0 );
			//assertEquals( "PayPal", item.paymentMethods[0] );
			
			// Test the listing details for the item
			var listingDetails:ListingDetails = item.listingDetails;
			assertNotNull( listingDetails );
			assertNotNull( listingDetails.startTime );
			assertTrue( listingDetails.startTime is Date );
			assertNotNull( listingDetails.endTime );
			assertTrue( listingDetails.endTime is Date );
			// Make sure the url has a valid value and starts with http
			assertTrue( listingDetails.viewItemURL.indexOf( "http" ) == 0 );
			
			// Test the selling status
			var sellingStatus:SellingStatus = item.sellingStatus;
			assertTrue( sellingStatus.bidCount >= 0 );
			assertTrue( sellingStatus.currentPrice > 0 );
			
			// Test the shipping details
			var shippingDetails:ShippingDetails = item.shippingDetails;
			//assertEquals( ShippingType.NOT_SPECIFIED, shippingDetails.shippingType );
		}
		
	}
	
	/**
	 * Test that parseAddOrRemoveFromWatchListResult operates successfully during
	 * an add to watch list operation.
	 */
	public function testParseAddToWatchListResult():void
	{
		var result:AddOrRemoveFromWatchListResult = EBayResultParser.parseAddOrRemoveFromWatchListResult( addToWatchListResponse );
		
		assertEquals( "Success", result.ack );
		assertEquals( 100, result.watchListMaximum );
		assertTrue( result.watchListCount >= 0 );
	}
	
	/**
	 * Test that parseAddOrRemoveFromWatchListResult operates successfully during
	 * a remove from watch list operation.
	 */
	public function testParseRemoveFromWatchListResult():void
	{
		var result:AddOrRemoveFromWatchListResult = EBayResultParser.parseAddOrRemoveFromWatchListResult( removeFromWatchListResponse );
		
		assertEquals( "Success", result.ack );
		assertEquals( 100, result.watchListMaximum );
		assertTrue( result.watchListCount >= 0 );
	}
	
	/**
	 * Test that parseEBayItem operates successfully.
	 */
	public function testParseEBayItem():void
	{
		var result:EBayItem = EBayResultParser.parseEBayItem( getItemResponse );
		
		assertFalse( result.autoPay );
		
		var bestOfferDetails:BestOfferDetails = result.bestOfferDetails;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( result.bestOfferDetails );

		assertEquals( BuyerProtection.ITEM_INELIGIBLE, result.buyerProtection );
		var buyerRequirements:BuyerRequirements = result.buyerRequirements;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( buyerRequirements );
		assertFalse( buyerRequirements.linkedPayPalAccount );
		var maximumItemRequirements:MaximumItemRequirements = buyerRequirements.maximumItemRequirements;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( maximumItemRequirements );
		assertEquals( 0, maximumItemRequirements.maximumItemCount );
		assertEquals( 0, maximumItemRequirements.minimumFeedbackScore );
		assertFalse( buyerRequirements.maximumUnpaidItemStrikes );
		assertEquals( 0, buyerRequirements.minimumFeedbackScore );
		assertFalse( buyerRequirements.shipToRegistrationCountry );
		var verifiedUserRequirements:VerifiedUserRequirements = buyerRequirements.verifiedUserRequirements;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( verifiedUserRequirements );
		assertEquals( 0, verifiedUserRequirements.minimumFeedbackScore );
		assertFalse( verifiedUserRequirements.verifiedUser );
		assertFalse( buyerRequirements.zeroFeedbackScore );
		
		assertFalse( result.buyerResponsibleForShipping );
		assertEquals( 50, result.buyItNowPrice );
		
		var charity:Charity = result.charity;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( charity );
		
		assertEquals( Country.US, result.country );
		var crossPromotion:CrossPromotion = result.crossPromotion;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( crossPromotion );
		
		assertEquals( Currency.USD, result.currency );
		assertTrue( result.description.length > 0 );
		
		var digitalDeliveryDetails:DigitalDeliveryDetails = result.digitalDeliveryDetails;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( digitalDeliveryDetails );
		
		assertFalse( result.disableBuyerRequirements );
		assertEquals( 0, result.dispatchTimeMax );
		
		assertFalse( result.getItFast );
		assertEquals( 0, result.giftIcon );
		assertTrue( result.giftServices is Array );
		assertEquals( 0, result.hitCount );
		assertEquals( HitCounter.NO_HIT_COUNTER, result.hitCounter );
		assertEquals( "110011443888", result.itemID );
		
		var listingCheckoutRedirectPreference:ListingCheckoutRedirectPreference = result.listingCheckoutRedirectPreference;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( listingCheckoutRedirectPreference );
		
		var listingDesigner:ListingDesigner = result.listingDesigner;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( listingDesigner );
		assertEquals( 10000, listingDesigner.layoutID );
		assertFalse( listingDesigner.optimalPictureSize );
		assertEquals( 10, listingDesigner.themeID );
		
		var listingDetails:ListingDetails = result.listingDetails;
		assertNotNull( listingDetails );
		assertFalse( listingDetails.adult );
		assertFalse( listingDetails.bindingAuction );
		assertFalse( listingDetails.buyItNowAvailable );
		assertTrue( listingDetails.checkoutEnabled );
		assertEquals( 50, listingDetails.convertedBuyItNowPrice );
		assertEquals( 0, listingDetails.convertedReservePrice );
		assertEquals( 1, listingDetails.convertedStartPrice );
		assertTrue( listingDetails.endTime is Date );
		
		var expressItemRequirements:ExpressItemRequirements = listingDetails.expressItemRequirements
		// TODO: Should this be null when not specified in the result?
		assertNotNull( expressItemRequirements );
		
		assertFalse( listingDetails.expressListing );
		assertFalse( listingDetails.hasPublicMessages );
		assertFalse( listingDetails.hasReservePrice );
		assertFalse( listingDetails.hasUnansweredQuestions );
		assertEquals( "", listingDetails.minimumBestOfferMessage );
		assertEquals( 0, listingDetails.minimumBestOfferPrice );
		assertEquals( "", listingDetails.relistedItemID );
		assertEquals( "", listingDetails.secondChanceOriginalItemID );
		// TODO: Should this default to undefined when no value is specifed in the result?
		//assertEquals( SellerBusiness.UNDEFINED, listingDetails.sellerBusinessType );
		assertTrue( listingDetails.startTime is Date );
		assertEquals( "", listingDetails.tcrOriginalItemID );
		assertTrue( listingDetails.viewItemURL.indexOf( "http://" ) == 0 );
		// TODO: Is there a code for this?  Does it make sense to have codes here?
		// Maybe split this out into listingDurationType -- day, year, etc) and 
		// listingDurationValue -- the number, like 1, 2 or 10.
		assertEquals( "Days_5", result.listingDuration );
		assertTrue( result.listingEnhancement is Array );
		assertEquals( "", result.listingSubtype );
		assertEquals( ListingType.CHINESE, result.listingType );
		assertEquals( "San Jose, CA", result.location );
		assertFalse( result.locationDefaulted );
		assertEquals( 0, result.lotSize );
		assertFalse( result.motorsGermanySearchable );
		assertFalse( result.nowAndNew );
		
		var paymentDetails:PaymentDetails = result.paymentDetails;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( paymentDetails );
		
		assertTrue( result.paymentMethods is Array );
		// TODO: Should BuyerPaymentMethod be renamed to PaymentMethod?
		assertEquals( BuyerPaymentMethod.PAYMENT_SEE_DESCRIPTION, result.paymentMethods[0] );
		assertEquals( BuyerPaymentMethod.VISA_MC, result.paymentMethods[1] );

		assertEquals( "", result.payPalEmailAddress );
		
		var pictureDetails:PictureDetails = result.pictureDetails;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( pictureDetails );
		assertTrue( PhotoDisplay.NONE, pictureDetails.photoDisplay );

		var primaryCategory:Category = result.primaryCategory;
		assertNotNull( primaryCategory );
		assertEquals( "66962", primaryCategory.categoryID );

		assertFalse( result.privateListing );
		assertFalse( result.proxyItem );
		assertEquals( 1, result.quantity );
		assertFalse( result.relisted );
		assertFalse( result.relistLink );
		
		var reviseStatus:ReviseStatus = result.reviseStatus;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( reviseStatus );
		
		var shippingDetails:ShippingDetails = result.shippingDetails;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( shippingDetails );
		assertFalse( shippingDetails.applyShippingDiscount );
		var calculatedShippingRate:CalculatedShippingRate = shippingDetails.calculatedShippingRate;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( calculatedShippingRate );
		var insuranceDetails:InsuranceDetails = shippingDetails.insuranceDetails;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( insuranceDetails );
		assertEquals( InsuranceOption.NOT_OFFERED, shippingDetails.insuranceOption );
		var internationalInsuranceDetails:InsuranceDetails = shippingDetails.internationalInsuranceDetails;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( internationalInsuranceDetails );
		assertTrue( shippingDetails.internationalShippingServiceOption is Array );
		
		var salesTax:SalesTax = shippingDetails.salesTax;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( salesTax );
		assertTrue( salesTax.shippingIncludedInTax );
		
		var taxTable:TaxTable = shippingDetails.taxTable;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( taxTable );
		
		assertFalse( result.shippingTermsInDescription );
		assertTrue( result.shipToLocations is Array );
		assertEquals( Country.US, result.shipToLocations[0] );
		assertEquals( Country.US, result.site );
		
		assertTrue( result.skypeContactOption is Array );
		assertFalse( result.skypeEnabled );
		
		var storeFront:StoreFront = result.storeFront;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( storeFront );
		assertEquals( "PT22H37M1S", result.timeLeft );
		assertTrue( result.timestamp is Date );
		assertEquals( "SONY DCR-VX2000, DCR-VX2100 RAPID CHARGER", result.title );
		
		var vatDetails:VATDetails = result.vatDetails;
		// TODO: Should this be null when not specified in the result?
		assertNotNull( vatDetails );
	}
	
	/**
	 * Test that parseMyEBayBuyingItems operates successfully.
	 */
	public function testParseMyEBayBuyingItems():void
	{
		fail( "get my ebay buying returns 'unsupported verb' and 'The API verb is not supported " 
			+ "in this release..' so I can't get a successful response packet to test" );
			
		var result:MyEBayBuyingItems = EBayResultParser.parseMyEBayBuyingItems( getMyEBayBuyingItemsResponse );
	}
	
	/**
	 * Test that parseEBayUser operates successfully.
	 */
	public function testParseEBayUser():void
	{
		var result:EBayUser = EBayResultParser.parseEBayUser( getUserResponse );
		
		assertTrue( result.aboutMePage is Boolean );
		assertTrue( result.aboutMePage );
		
		var buyerInfo:BuyerInfo = result.buyerInfo;
		assertNotNull( buyerInfo );
		
		var shippingAddress:Address = buyerInfo.shippingAddress;
		assertNotNull( shippingAddress );
		
		assertTrue( result.eBayGoodStanding );
		assertTrue( result.eBayWikiReadOnly );
		
		assertTrue( result.eiasToken.length > 0 );
		assertTrue( result.email.length > 0 );
		assertFalse( result.feedbackPrivate );
		assertTrue( result.feedbackRatingStar.length > 0 );
		assertTrue( result.feedbackScore > 0 );
		assertTrue( result.idVerified );
		assertFalse( result.motorsDealer );
		assertFalse( result.newUser );
		// TODO: Should these be set to UNKNOWN when not specified in the result?
		//assertEquals( PayPalAccountLevel.UNKNOWN, result.payPalAccountLevel );
		//assertEquals( PayPalAccountStatus.UNKNOWN, result.payPalAccountStatus );
		//assertEquals( PayPalAccountType.UNKNOWN, result.payPalAccountType );
		// TODO: Should this be NaN when not specified in the result?
		//assertTrue( result.positiveFeedbackPercent > 0 );
		
		var registrationAddress:Address = result.registrationAddress;
		assertNotNull( registrationAddress );
		assertTrue( result.registrationDate is Date );
		
		var sellerInfo:Seller = result.sellerInfo;
		assertNotNull( sellerInfo );
		assertTrue( sellerInfo.allowPaymentEdit );
		//assertEquals( Currency.USD, sellerInfo.billingCurrency );
		assertFalse( sellerInfo.charityRegistered );
		assertTrue( sellerInfo.checkoutEnabled );
		assertFalse( sellerInfo.cipBankAccountStored );
		assertFalse( sellerInfo.expressEligible );
		
		// TODO: Should this default to null when not specified in the result?
		var expressSellerRequirements:ExpressSellerRequirements = sellerInfo.expressSellerRequirements;
		assertNotNull( expressSellerRequirements );
		//assertFalse( expressSellerRequirements.businessSeller );
		//assertFalse( expressSellerRequirements.combinedPaymentsAccepted );
		//assertFalse( expressSellerRequirements.eligiblePayPalAccount );
		//assertFalse( expressSellerRequirements.expressApproved );
		//assertFalse( expressSellerRequirements.feedbackAsSellerScore );
		//assertFalse( expressSellerRequirements.feedbackPublic );
		//assertFalse( expressSellerRequirements.feedbackScore );
		
		assertFalse( sellerInfo.expressWallet );
		assertTrue( sellerInfo.goodStanding );
		assertFalse( sellerInfo.liveAuctionAuthorized );
		assertEquals( MerchandizingPref.OPT_IN, sellerInfo.merchandizingPref );
		assertTrue( sellerInfo.paisaPayStatus >= 0 );
		assertFalse( sellerInfo.qualifiesForB2BVAT );
		assertFalse( sellerInfo.registeredBusinessSeller );
		
		var schedulingInfo:SchedulingInfo = sellerInfo.schedulingInfo;
		assertNotNull( schedulingInfo );
		assertEquals( 3000, schedulingInfo.maxScheduledItems );
		assertEquals( 30240, schedulingInfo.maxScheduledMinutes );
		assertEquals( 0, schedulingInfo.minScheduledMinutes );
		
		// TODO: Should this default to undefined when not specified in the result?
		//assertEquals( SellerBusiness.UNDEFINED, sellerInfo.sellerBusinessType );
		assertEquals( SellerGuaranteeLevel.NOT_ELIGIBLE, sellerInfo.sellerGuaranteeLevel );
		assertEquals( SellerLevel.NONE, sellerInfo.sellerLevel );
		
		var sellerPaymentAddress:Address = sellerInfo.sellerPaymentAddress;
		// TODO: Should this default to null when not specified in the result?
		assertNotNull( sellerPaymentAddress );
		assertFalse( sellerInfo.storeOwner );
		
		// TODO: Should this default to nothing on file when not specified?
		//assertEquals( SellerPaymentMethod.NOTHING_ON_FILE, result.sellerPaymentMethod );
		
		assertEquals( Country.US, result.site );
		assertTrue( result.skypeID is Array );
		assertTrue( result.timestamp is Date );
		assertTrue( result.tuvLevel >= 0 );
		assertEquals( -1, result.uniqueNegativeFeedbackCount );
		assertEquals( -1, result.uniquePositiveFeedbackCount );
		assertEquals( "dunnproducts_com", result.userID );
		assertFalse( result.userIDChanged );
		assertTrue( result.userIDLastChanged is Date );
		assertTrue( result.userSubscription is Array );
		assertEquals( "489", result.version );
	}
	
	/**
	 * Test that parsePlaceOfferResult operates successfully.
	 */
	public function testParsePlaceOfferResult():void
	{
		fail( "place offer always returns 'Your application is not authorized to make this call.' "
			+ "so I can't get a successful response packet to test");
		
		var result:PlaceOfferResult = EBayResultParser.parsePlaceOfferResult( placeOfferResult );
		
		assertNotNull( result.sellingStatus );
		assertTrue( result.sellingStatus is SellingStatus );
		
		var sellingStatus:SellingStatus = result.sellingStatus;

		assertTrue( sellingStatus.bidCount > 0 );
		assertTrue( sellingStatus.bidIncrement >= 0 );
		// TODO: More...		
	}
	
	
} // end class
} // end package