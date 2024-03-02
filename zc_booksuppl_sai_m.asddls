@EndUserText.label: 'Booking suppl projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_BOOKSUPPL_SAI_M
  as projection on ZI_BOOKSUPPL_SAI_M
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Travel  : redirected to ZC_TRAVEL_SAI_M,
      _Booking : redirected to parent ZC_BOOKING_SAI_M,
      _Supplement,
      _Suppl_text
}
