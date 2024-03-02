@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supp interface view managed'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BOOKSUPPL_SAI_M
  as select from zbooksuppl_sai_m
  association        to parent ZI_BOOKING_SAI_M as _Booking    on  $projection.BookingId = _Booking.BookingId
                                                               and $projection.TravelId  = _Booking.TravelId
  association [1..1] to ZI_TRAVEL_SAIK_M        as _Travel     on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement       as _Supplement on  $projection.SupplementId = _Supplement.SupplementID
  association [1..*] to /DMO/I_SupplementText   as _Suppl_text on  $projection.SupplementId = _Suppl_text.SupplementID
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      //persistent field last_changed_at plays an a special role as a field ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at       as LastChangedAt,
      _Supplement,
      _Suppl_text,
      _Booking,
      _Travel
}
