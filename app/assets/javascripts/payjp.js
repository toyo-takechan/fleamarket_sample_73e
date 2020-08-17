$(function () {
  console.log("aaa")
  Payjp.setPublicKey("pk_test_2cf741aa229ef28c8cb488a9");
  $("#token_submit").click(function (e) {
    console.log("bbb")
    e.preventDefault();
    let card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val()
    };
    console.log(card)
    Payjp.createToken(card, function (status, response) {
      console.log(response)
      if (status === 200) {
        $("#card_token").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        );
        $('#charge-form').submit();
      } else {
        alert("カード情報が正しくありません。");
      }
    });
  });
});