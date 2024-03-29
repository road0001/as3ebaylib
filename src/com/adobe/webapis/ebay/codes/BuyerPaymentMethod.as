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



package com.adobe.webapis.ebay.codes
{
	/**
	 * Provides constants for the BuyerPaymentMethodCodeType simple type.
	 * 
	 * <p>This class identifies the code types that eBay could use to identify 
	 * the payment methods used by a buyer to pay a seller.  On item listings, 
	 * this class identifies one of the payment methods the seller will accept for
	 * the item.</p>
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9
	 * @tiptext
	 * 
	 * @author Charles Bihis, Adobe Systems Incorporated
	 * 
	 * @see http://developer.ebay.com/DevZone/SOAP/docs/WSDL/xsd/1/simpletype/BuyerPaymentMethodCodeType.htm
	 */	
	public final class BuyerPaymentMethod
	{
		public static const NONE:String = "None";
		public static const MOCC:String = "MOCC";
		public static const AM_EX:String = "AmEx";
		public static const PAYMENT_SEE_DESCRIPTION:String = "PaymentSeeDescription";
		public static const CC_ACCEPTED:String = "CCAccepted";
		public static const PERSONAL_CHECK:String = "PersonalCheck";
		public static const COD:String = "COD";
		public static const VISA_MC:String = "VisaMC";
		public static const PAISA_PAY_ACCEPTED:String = "PaisaPayAccepted";
		public static const OTHER:String = "Other";
		public static const PAYPAL:String = "PayPal";
		public static const DISCOVER:String = "Discover";
		public static const CASH_ON_PICKUP:String = "CashOnPickup";
		public static const MONEY_XFER_ACCEPTED:String = "MoneyXferAccepted";
		public static const MONEY_XFER_ACCEPTED_IN_CHECKOUT:String = "MoneyXferAcceptedInCheckout";
		public static const OTHER_ONLINE_PAYMENTS:String = "OtherOnlinePayments";
		public static const ESCROW:String = "Escrow";
		public static const PRE_PAY_DELIVERY:String = "PrePayDelivery";
		public static const COD_PRE_PAY_DELIVERY:String = "CODPrePayDelivery";
		public static const POSTAL_TRANSFER:String = "PostalTransfer";
		public static const CUSTOM_CODE:String = "CustomCode";
		public static const LOAN_CHECK:String = "LoanCheck";
		public static const CASH_IN_PERSON:String = "CashInPerson";
		public static const ELV:String = "ELV";
	}  // class declaration
}  // package