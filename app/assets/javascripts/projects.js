$(document).ready(function(){
  $.each(["contact", "attachment", "link", "estimate"], function(){
    var item = this;
    $(".add_new_" + item + "_button").click(function(){
      $(".new_" + item + "_form").show();
    });
    $(".cancel_new_" + item + "_button").click(function(){
      $(".new_" + item + "_form").hide();
      $(".new_" + item + "_form form")[0].reset();
      return false;
    });
  });
});
