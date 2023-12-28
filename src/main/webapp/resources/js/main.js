document.addEventListener('DOMContentLoaded', function() {
	const sNumArrayValue = localStorage.getItem('sNumArray');
	const sNumArray = JSON.parse(sNumArrayValue);
	
    let stores = [0, 0, 0, 0, 0];
    for (let i = 0; i < 5; i++) {
    if (sNumArray[i] !== undefined) {
        stores[i] = sNumArray[i];
    	}
	}
    console.log(stores);
    const sendData = {store1 : stores[0],
    					store2 : stores[1],
    					store3 : stores[2],
    					store4 : stores[3],
    					store5 : stores[4]
    					};
	storeApi.showRecentStore(sendData,function(data){
		drawRecentStore(data);
		console.log("ajax", data[0]);
	})

});

function drawRecentStore(data){
	let divToUpdate = $('.recent_list');
	let htmlContent = '';
	
	$.each(data, function (index, store) {
                htmlContent += '<a href="resDetailPage?storeNumber=' + store.storeNo + '">'
							+ `<img class="recentImg" src="/bigFish/resources/uploadFiles/`+store.thumbnailImg+`">`
							+ `<div class="rSName">`+ store.storeName +`</div></a>`;
            });
	
	divToUpdate.html(htmlContent);
}