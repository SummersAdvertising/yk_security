editor.anchor = {
	initTab: function(){
		var li = $("<li>");
		li.attr("data-type", "anchor").attr("id", "tab-anchor");
		var a = $("<a>").append("錨點");
		var icon = $("<img>").attr("src", "/images/pin.png");
		a.prepend(icon);

		li.append(a);
		$(".editorList").append(li);
	},
	initPost: function(){
		var editorChild = $("<div>");
		editorChild.attr("id", "post-anchor");
		editorChild.addClass("editorChild box");
		var select = $("<select>");

		editor.anchor.add_options(select);

		select.focus(function(){
			editor.anchor.add_options($(this));
		});

		var table = $('<table width="100%" border="0" cellspacing="0" cellpadding="0"></table>');
		table.append($('<tr>').append($('<td width="95%">').append(select))
							  .append($('<td width="5%" class="send">')));

		$(".editorContent").append(editorChild.append(table));
	},
	add_options: function(select){
		var option_arr = jQuery.map( $("#items-container li input"), function( a ) {
				var a_value = $(a).val(); 
				if(a_value){
					return "<option>" + a_value + "</option>";
				}
				else{
					return "";
				}
			});
		select.attr("id", "newAnchor").html(option_arr.join());
	},
	add: function(){
		if(!$("#newAnchor").val()){
			editor.alert("請選擇錨點連結", "error");
			return;
		}
		if($("span[data-link='"+escape($("#newAnchor").val())+"']").length){
			editor.alert("錨點已經設置過了", "error");
			return;
		}

		var anchor = new Object();
		anchor.link = escape($("#newAnchor").val());

		editor.anchor.show(anchor);
		editor.save();
	},
	show: function(paragraph){
		var paragraphBox = this.output(paragraph);
		paragraphBox.addClass("paragraphContainer part");

		this.bindControl(paragraphBox);
	},
	output: function(paragraph){
		var paragraphBox = $("<div>");
		paragraphBox.attr("data-type", "anchor");

		var p = $("<p>");
		p.html('<img src="/images/pin.png"/> <span data-link="' + paragraph.link + '"><a id="' + paragraph.link + '" name="' + paragraph.link + '">( 錨點：' + unescape(paragraph.link) + ' )</a></span>');

		paragraphBox.append(p);
		editor.settings.articleSection.append(paragraphBox);

		return paragraphBox;
	},
	pack: function(paragraphContainer){
		var content = $(paragraphContainer).children("p:first").children("span:first");
		var paragraph = new Object();
		paragraph.type = "anchor";
		paragraph.link = content.data("link");

        return paragraph;
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