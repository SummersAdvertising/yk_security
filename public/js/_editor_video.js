editor.video = {
	initTab: function(){
		var li = $("<li>");
		li.attr("data-type", "video").attr("id", "tab-video");
		var a = $("<a>").append("影片");
		var icon = $("<img>").attr("src", "/images/film.png");
		a.prepend(icon);

		li.append(a);
		$(".editorList").append(li);
	},
	initPost: function(){
		var editorChild = $("<div>");
		editorChild.attr("id", "post-video");
		editorChild.addClass("editorChild box");
		var link = $("<input>");
		link.attr("id", "newVideoContent").attr("placeholder", "貼上 YouTube 網址").css("width", "320px");

		var table = $('<table width="100%" border="0" cellspacing="0" cellpadding="0"></table>');
		table.append($('<tr>').append($('<td width="100%" class="text">').append(link)));

		$(".editorContent").append(editorChild.append(table));
	},
	add: function(){
		if(!$("#newVideoContent").val()){
			editor.alert("請貼上影片連結", "error");
			return;
		}

		var video = editor.video.getVideoInfo($("#newVideoContent").val());

		editor.resetChild();

		if(video.provider){
			editor.video.show(video);
			editor.save();
		}
		else{
			editor.alert("不支援此連結", "error");
		}
	},
	show: function(paragraph){
		var paragraphBox = this.output(paragraph);
		paragraphBox.addClass("paragraphContainer part");

		this.bindControl(paragraphBox);
	},
	output: function(paragraph){
		var paragraphBox = $("<div>");
		paragraphBox.attr("data-type", "video");

		var iframe = $("<iframe>");

		iframe.attr("width", "480").attr("height", "290").attr("frameborder", "0").attr("frameborder", "");
		iframe.attr("data-provider", paragraph.provider);
		iframe.attr("src", paragraph.embedcode);

		paragraphBox.append(iframe);
		editor.settings.articleSection.append(paragraphBox);

		return paragraphBox;
	},
	pack: function(paragraphContainer){
		var content = $(paragraphContainer).children("iframe:first");
		var paragraph = new Object();
		paragraph.type = "video";
		paragraph.provider = content.data("provider");
		paragraph.embedcode = content.attr("src");

        return paragraph;
	},
	getVideoInfo: function(link){
		var video = new Object();
		video.type = "video";

		var providerList = ["youtube", "vimeo"];
		for( var p in providerList ) {
			var re = new RegExp("/.*" + providerList[p] + ".*/", "g");
			if ( re.test(link) ) {
				video.provider = providerList[p];
			}
		}

		if(video.provider){
			switch(video.provider){
				case "vimeo":
				var sourceLink = "http://player.vimeo.com/video/";
				var code = /[a-zA-Z0-9\?\.\:]+\/([a-zA-Z0-9_\-]+)&?.*/.exec(link)[1];
				video.embedcode = sourceLink + code;
				break;
				
				case "youtube":
				var sourceLink = "http://www.youtube.com/embed/";
				var code = /[a-zA-Z0-9\?\.\:\/&=]+v=([a-zA-Z0-9_\-]+)&?.*/.exec(link)[1];
				video.embedcode = sourceLink + code;
				break;
			}

			return video;
		}
		else{
			return false;
		}
	},
	bindControl: function(paragraphBox){
		var controlPanel = $("<div>");
		controlPanel.addClass("controlPanel tool-b tool");

		var del = $("<a>");
		del.append("刪除").addClass("delete");
		del.click(function(){
			paragraphBox.remove();
			editor.save();
		});

		controlPanel.append(del);
		paragraphBox.prepend(controlPanel);

	}
};