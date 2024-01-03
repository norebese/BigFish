    function checkInputs() {
            // 각 input 태그에 대한 값을 가져와서 확인
            let input1 = document.getElementById('input1').value.trim();
            let input2 = document.getElementById('input2').value.trim();
            // 필요한 만큼 다른 input 변수들을 추가

            // 만약 어떤 조건을 만족하지 않으면 버튼을 비활성화
            if (input1 === '' || input2 === '') {
                document.getElementById('subBtn').disabled = true;
            } else {
                document.getElementById('subBtn').disabled = false;
            }
        }
