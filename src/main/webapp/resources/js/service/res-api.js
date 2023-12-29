const resApi = {
	updateDetailInfo : function(data, callback){
		$.ajax({
           type: "GET",
           url: "ajaxUpdateDetailInfo",
           data: data,
			dataType: 'json',
           success: function(data) {
        	   callback(data)
           },
           error: function() {
           	console.log("ajax 통신 실패");
           }
       });
	},
	dltReply : function(data, callback){
		$.ajax({
	           type: "GET",
	           url: "ajaxDltReply",
	           data: data,
	           dataType: 'json',
	           success: function(data) {
	        	   callback(data)
	           },
	           error: function() {
	           	console.log("ajax 통신 실패");
	           }
	       });
	},
	pageReply : function(data, callback){
		$.ajax({
	           type: "GET",
	           url: "ajaxPageReply", 
	           data: data,
	           dataType: 'json',
	           success: function(data) {
	        	   callback(data)
	           },
	           error: function() {
	           	console.log("ajax 통신 실패");
	           }
	       });
	},
	addReply : function(data, callback){
		$.ajax({
	           type: "GET",
	           url: "ajaxAddReply",
	           data: data,
	           dataType: 'json',
	           success: function(data) {
	        	   callback(data)
	           },
	           error: function() {
	           	console.log("ajax 통신 실패");
	           }
	       });
	},
	updateLike : function(callback){
		$.ajax({
               type: "GET",
               url: "ajaxUpdateLike", 
               success: function(data) {
            	   callback(data)
               },
               error: function() {
               	console.log("ajax 통신 실패");
               }
           });
	},
	loadTickets : function(data, callback){
		$.ajax({
            type: "GET",
            url: "loadTickets", 
            data: data,
            dataType: 'json',
            success: function(data) {
            	callback(data)
            },
            error: function() {
            	console.log("ajax 통신 실패");
            }
        });
	},
	saveSelectedDate : function(data, callback){
		$.ajax({
            type: "GET",
            url: "insertReservation", 
            data: data,
            success: function(response) {
            	callback(data)
            },
            error: function() {
            	console.log("ajax 통신 실패");
            }
        });
	},
	moreResList : function(data, callback){
		$.ajax({
	           type: "GET",
	           url: "moreResList",
	           data: data,
	           dataType: 'json',
	           success: function(data) {
	        	   callback(data)
	           },
	           error: function() {
	           	console.log("ajax 통신 실패");
	           }
	       });
	}



}