$(document).ready(function(){
    function zero(num){
        if(num <= 9){
            num = "0"+num;
        }
        return num;
    }
    var now = new Date();
    var nowdate = now.getTime();
    var nowday = now.getDay();
    var sun = nowdate - nowday*86400000;
    sun = new Date(sun);
    sun = sun.getFullYear()+"-"+zero(sun.getMonth()+1)+"-"+sun.getDate();
    
    function chk(city){
        $.ajax({
        url:"http://cors-anywhere.herokuapp.com/http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMinuDustWeekFrcstDspth",
        data: {
            serviceKey:"ba3BZYpfzQRZ+pSsFzLLcPcyqi58Tx5AxxF7ZORluWT715l9KNM/ljXuPLW0zxUoCAxkQCXIMFWutBlszrNm2w==",
            searchDate: sun,
            returnType: "json"
        },
        //보내는 데이터 타입 유성구 대덕대로 593, 도룡동 대덕태크비즈센터 205호
        type: "get",
        success: function(result){
            console.log(result);
            var txt = result.response.body.items[0].gwthcnd;
            var one = result.response.body.items[0].frcstOneCn;
            var two = result.response.body.items[0].frcstTwoCn;
            var three = result.response.body.items[0].frcstThreeCn;
            var four = result.response.body.items[0].frcstFourCn;
            var onedt = result.response.body.items[0].frcstOneDt;
            var twodt = result.response.body.items[0].frcstTwoDt;
            var threedt = result.response.body.items[0].frcstThreeDt;
            var fourdt = result.response.body.items[0].frcstFourDt;
            one = one.split(", ");
            two = two.split(", ");
            three = three.split(", ");
            four = four.split(", ");
            var cityName = one[city].split(" : ")[0];
            one = one[city].split(" : ")[1];
            two = two[city].split(" : ")[1];
            three = three[city].split(" : ")[1];
            four = four[city].split(" : ")[1];  
            $("#onedt").text(onedt);
            if(one == "낮음"){
                $("#today i").removeClass().addClass("fas").addClass("fa-face-smile").addClass("text-success");
            }else{
                $("#today i").removeClass().addClass("fas").addClass("fa-face-angry").addClass("text-danger");
            }
            $("#location").text(cityName);
            $("#onecn").text(one);
            $("#note").text(txt);
            
            $("#two .dt").text(twodt);
            $("#three .dt").text(threedt);
            $("#four .dt").text(fourdt);
            
            $("#two .cn").text(two);
            $("#three .cn").text(three);
            $("#four .cn").text(four);
            
            if(two == "낮음"){
                $("#two i").removeClass().addClass("fas").addClass("fa-smile").addClass("text-success");
            }else{
                 $("#two i").removeClass().addClass("fas").addClass("fa-angry").addClass("text-danger");
            }
            if(three == "낮음"){
                $("#three i").removeClass().addClass("fas").addClass("fa-smile").addClass("text-success");
            }else{
                 $("#three i").removeClass().addClass("fas").addClass("fa-angry").addClass("text-danger");
            }
            if(four == "낮음"){
                $("#four i").removeClass().addClass("fas").addClass("fa").addClass("fa-smile").addClass("text-success");
            }else{
                 $("#four i").removeClass().addClass("fas").addClass("fa-angry").addClass("text-danger");
            }
        }
        });
    }
    
    chk(0);
    $("#city").change(function(){
        var city = $(this).val();
        chk(city);
    });
});