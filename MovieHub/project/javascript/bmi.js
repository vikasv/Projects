$(document).ready(function () {

    $('.navigation-menu li .nav-bar').each(function () {
        $(this).before($(this).clone().removeClass().addClass('hover-bar'));
    });
    $('.navigation-menu li').hover(function () {
        $(this).find('.hover-bar').stop().animate({ marginTop: '0px' }, 200);
    },
    function () {
        $(this).find('.hover-bar').stop().animate({ marginTop: '-63px' }, 200);
    });
});

$(document).ready(function () {
    $('#pwd-null-error').hide(0);
    $('#username-null-error').hide(0);
    $('#mismatch-error').hide(0);

    $('#age-null-error').hide(0);
    $('#height-null-error').hide(0);
    $('#weight-null-error').hide(0);
});


function compute_bmi() {
    if (validateForm()) {
        $('#unit1').removeClass("highlight");
        $('#unit2').removeClass("highlight");
        $('#unit3').removeClass("highlight");
        $('#unit4').removeClass("highlight");
        $('#unit5').removeClass("highlight");
        $('#unit6').removeClass("highlight");
        $('#unit7').removeClass("highlight");
        $('#unit8').removeClass("highlight");
        $('#val1').removeClass("highlight");
        $('#val2').removeClass("highlight");
        $('#val3').removeClass("highlight");
        $('#val4').removeClass("highlight");
        $('#val5').removeClass("highlight");
        $('#val6').removeClass("highlight");
        $('#val7').removeClass("highlight");
        $('#val8').removeClass("highlight");
        var weight = document.getElementById('weight').value
        var height = document.getElementById('height').value
        var height_m = height / 100
        var BMI = weight / (height_m * height_m)
        var myBMI = Round(BMI, 1);
        document.getElementById("result-value").innerHTML = myBMI;

        if (myBMI <= 15) {
            $('#unit1').addClass("highlight");
            $('#val1').addClass("highlight");
        }

        if (myBMI > 15 && myBMI <= 16) {
            $('#unit2').addClass("highlight");
            $('#val2').addClass("highlight");
        }

        if (myBMI > 16 && myBMI <= 18.5) {
            $('#unit3').addClass("highlight");
            $('#val3').addClass("highlight");
        }

        if (myBMI > 18.5 && myBMI <= 25) {
            $('#unit4').addClass("highlight");
            $('#val4').addClass("highlight");
        }

        if (myBMI > 25 && myBMI <= 30) {
            $('#unit5').addClass("highlight");
            $('#val5').addClass("highlight");
        }

        if (myBMI > 30 && myBMI <= 35) {
            $('#unit6').addClass("highlight");
            $('#val6').addClass("highlight");
        }

        if (myBMI > 35 && myBMI <= 40) {
            $('#unit7').addClass("highlight");
            $('#val7').addClass("highlight");
        }

        if (myBMI > 40) {
            $('#unit8').addClass("highlight");
            $('#val8').addClass("highlight");
        }
    }
}

function Round(x, places) {
    return (Math.round(x * Math.pow(10, places))) / Math.pow(10, places)
}

function validateForm() {
    var age = $('#age').val();
    var height = $('#height').val();
    var weight = $('#weight').val();
    if (age == "") {
        $('#age-null-error').show(0);
        $('#age').css('border', '1px solid red');
        $('#age').focus(function () {
            $('#age').css('border', 'none');
            $('#age-null-error').hide(0);
        });
        return false;
    } else if (height == "") {
        $('#height-null-error').show(0);
        $('#height').css('border', '1px solid red');
        $('#height').focus(function () {
            $('#height').css('border', 'none');
            $('#height-null-error').hide(0);
        });
        return false;
    } else if (weight == "") {
        $('#weight-null-error').show(0);
        $('#weight').css('border', '1px solid red');
        $('#weight').focus(function () {
            $('#weight').css('border', 'none');
            $('#weight-null-error').hide(0);
        });
        return false;
    }
    return true;
}


