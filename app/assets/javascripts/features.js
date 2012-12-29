$(document).ready(function () {
  AE.handle_new_object_forms(["effort"]);
  $("#effort_default_value").spinner({ min: 0 });
  $.each($('.range'), function(){
    $(this).slider({
      slide: AE.update_feature_range,
      change: AE.save_feature_range,
      create: AE.set_values_for_feature_range,
      min: 0,
      max: 40,
      values: [0, 0, 0]
    });
  });
});
