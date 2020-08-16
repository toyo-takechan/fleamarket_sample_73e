$(function () {
  Payjp.setPublicKey("pk_test_2cf741aa229ef28c8cb488a9");
  $("#token_submit").click(function (e) {
    e.preventDefault();
    let card = {
      number: $("#card_number").value,
      cvc: $("#cvc").value,
      exp_month: $("#exp_month").value,
      exp_year: $("#exp_year").value
    };
    console.log(card)
    Payjp.createToken(card, function (status, response) {
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