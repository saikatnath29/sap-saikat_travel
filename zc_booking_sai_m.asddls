@EndUserText.label: 'Booking projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_BOOKING_SAI_M
  as projection on ZI_BOOKING_SAI_M
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      @ObjectModel.text.element: [ 'BookingStatusText' ]
      BookingStatus,
      _Booking_Status._Text.Text as BookingStatusText : localized,
      LastChangedAt,
      /* Associations */
      _Bookingsuppl : redirected to composition child ZC_BOOKSUPPL_SAI_M,
      _Booking_Status,
      _Carrier,
      _Connection,
      _Customer,
      _Travel       : redirected to parent ZC_TRAVEL_SAI_M
}
