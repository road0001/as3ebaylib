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



package com.adobe.webapis.ebay.objects
{
	/**
	 * Contains summary data for the item listing itself, with the properties
	 * that define the listing.
	 * 
	 * <p>Contains the following additional objects:
	 * 	<ul>
	 *		<li><code>Category</code></li>
	 * 		<li><code>DigitalDeliveryDetails</code></li>
	 * 		<li><code>Distance</code></li>
	 * 		<li><code>ListingDetails</code></li>
	 * 		<li><code>PictureDetails</code></li>
	 * 		<li><code>SearchDetails</code></li>
	 * 		<li><code>SellingStatus</code></li>
	 * 		<li><code>ShippingDetails</code></li>
	 * 		<li><code>StoreFront</code></li>
	 * 	</ul>
	 * </p>
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Charles Bihis, Adobe Systems Incorporated
	 * 
	 * @see com.adobe.webapis.ebay.objects.Category
	 * @see com.adobe.webapis.ebay.objects.DigitalDeliveryDetails
	 * @see com.adobe.webapis.ebay.objects.Distance
	 * @see com.adobe.webapis.ebay.objects.ListingDetails
	 * @see com.adobe.webapis.ebay.objects.PictureDetails
	 * @see com.adobe.webapis.ebay.objects.SearchDetails
	 * @see com.adobe.webapis.ebay.objects.SellingStatus
	 * @see com.adobe.webapis.ebay.objects.ShippingDetails
	 * @see com.adobe.webapis.ebay.objects.StoreFront
	 */
	public class Item
	{
		public var bestOfferEnabled:Boolean;
		public var buyerProtection:String;
		public var buyItNowPrice:Number;
		public var country:String;
		public var currency:String;
		public var digitalDeliveryDetails:DigitalDeliveryDetails;
		public var distance:Distance;
		public var itemID:String;
		public var listingDetails:ListingDetails;
		public var listingDuration:String;
		[ArrayElementType("String")]
		public var listingEnhancement:Array;
		public var listingType:String;
		public var localListing:Boolean;
		public var motorsGermanySearchable:Boolean;
		[ArrayElementType("String")]
		public var paymentMethods:Array;
		public var pictureDetails:PictureDetails;
		public var postalCode:String;
		public var primaryCategory:Category;
		public var searchDetails:SearchDetails;
		public var secondaryCategory:Category;
		public var seller:String;
		public var sellingStatus:SellingStatus;
		public var shippingDetails:ShippingDetails;
		public var storeFront:StoreFront;
		public var title:String;
		

		/**
		 * Constructor for the Item class.
		 * 
		 * <p>Creates a new Item object.</p>
		 */
		public function Item()
		{
			this.listingEnhancement = new Array();
			this.paymentMethods = new Array();
		}  // Item
	}  // class declaration
}  // package