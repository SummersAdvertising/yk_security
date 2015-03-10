
editor.list = {
	initTab: function(){
		var li = $("<li>");
		li.attr("data-type", "list").attr("id", "tab-list");
		var a = $("<a>").append("插入清單");
		var icon = $("<img>").attr("src", "/images/list.png");
		a.prepend(icon);

		li.append(a);
		$(".editorList").append(li);
	},
	initPost: function(){		
		var editorChild = $("<div>");
		editorChild.attr("id", "post-list");
		editorChild.addClass("editorChild");
		 	
		var initRows = 3;
		// available class
		var StyleClassArray = ['peditor_list_disc','peditor_list_circle','peditor_list_customize'];
		var StyleNameArray = ['實心圓點','數字編號','其他'];
		
		var container = $('<ul id="newListContent" class="none"></ul>');
		$(container).attr('class',StyleClassArray[0])

		/* 插入選單：class */
		var select = $("<select id='style_dropdown'>");
		var option = '';
		for (i=0;i<StyleClassArray.length;i++){
		   option += '<option value="'+ StyleClassArray[i] + '">' + StyleNameArray[i] + '</option>';
		}
		select.append(option);
		
		// select onchange event listener
		select.change(function() {
		  var currType = $('#style_dropdown').val();
			//change list type
			var typeIndex = $.inArray(currType, StyleClassArray);
			$('#newListContent').attr('class', StyleClassArray[typeIndex]);
			// console.log(currType);
		});

		editorChild.append(select);
		
		for( var i = 0 ; i < initRows; i ++ ) {
			$('<li><input type="text" class="listElement autogrow" /></li>').appendTo( container );
		}
		
		editorChild.append(container);

		$('<div class="addlist"></div>').append(
			$('<a href="javascript: void(0);">增加</a>').click(function() {
				container.append('<li><input type="text" class="listElement autogrow" /></li>');
			})
		).appendTo(editorChild);

		$(".editorContent").append(editorChild);
	},
	add: function(){

  	  var inputed = false;
  
  	  var listContents = [];
  	  // var listStyle = $(document.getElementById("newListContent")).attr("style");
  	  var listStyle = $("#newListContent").attr("class");
  	  
	  $('#newListContent input').each(function() {
	  
		  if ( $( this ).val() ) {
			  inputed = true;
		  } else {
			return;  
		  }
		  
		  listContents.push( editor.filter($(this).val(), editor.HTMLfilter) );
	  });
	  
	  if ( !inputed ) {	  
			editor.alert("請輸入內容", "error");
			return ;
	  }

		var list = new Object();

		list.content = listContents;
		list.style = listStyle;
		
		editor.list.show(list);
		editor.resetChild();

		editor.save();
		$("#newListContent > li[value=0]").removeAttr('value');
		
		//document.getElementById("newListContent").style.listStyleType = "none !important";
	},
	show: function(paragraph){	
	
		var paragraphBox = this.output(paragraph);
		paragraphBox.addClass("paragraphContainer part");

		this.bindControl(paragraphBox);
	},
	output: function(paragraph){
		var paragraphBox = $("<div>");
		paragraphBox.attr("data-type", "list");

		var ulContainer = $("<ul></ul>");
		// ulContainer.attr("style",paragraph.style);
		ulContainer.attr("class",paragraph.style);
		
		paragraphBox.append(ulContainer);
		for ( var index in paragraph.content ){
		  var element = paragraph.content[index];
		  
		  $("<li>" + element + "</li>").appendTo(ulContainer);			  
		}
		  
		editor.settings.articleSection.append(paragraphBox);

		return paragraphBox;
	},
	edit: function(paragraphContainer, controlPanel){
		controlPanel.hide();
		$(".controlPanel a[data-control = edit]").each(function(){
			$(this).unbind();
		});
				
		var contentBlock = paragraphContainer.children("ul");
		
		var editPanel = $("<div class='editbox part part-edit'>");
		var editContainer = $('<ul></ul>');
		
		var elements = paragraphContainer.children("ul").children('li');
		contentBlock.hide();
		
		elements.each(function() {
			var element = $('<li><input type="text" class="text" value="' + $(this).html() + '"></li>');
			editContainer.append(element);
		});
		
		var tool_a = $("<div class='tool-a'>"); 
		var cancel = $("<a>");
		cancel.append("取消");
		cancel.click(function(){
			editPanel.remove();
			controlPanel.removeAttr("style");
			paragraphContainer.children("ul").show();

			$(".controlPanel a[data-control = edit]").each(function(){
				var type = $(this).parents(".paragraphContainer").data("type");
				editor[type].bindEdit(this);
			});
		});

		var save = $("<a>");
		save.append("完成");
		save.click(function(){
			controlPanel.removeAttr("style");
			
			var valid_modify = false;
		    
		    var editElements = editContainer.children('li');
		    var elementContainer = paragraphContainer.children('ul');
		    
		    editElements.each(function() {
				var element = $(this);
				var listContent = element.children('input').val();		
				
				if (listContent.length > 0) {
					if (!valid_modify) {
						elementContainer.children("li").remove();
					}
					valid_modify = true;					
					elementContainer.append('<li>' + listContent + '</li>');					
				}
			}); 
		
			if (valid_modify) {				
				editPanel.remove();
				editor.save();
				
				contentBlock.show();
				

				$(".controlPanel a[data-control = edit]").each(function(){
					var type = $(this).parents(".paragraphContainer").data("type");
					editor[type].bindEdit(this);
				});
			}
			else{
				editor.alert("請輸入修改內容", "error");
			}
			
		});

		tool_a.append(save).append(cancel);
		editPanel.append(editContainer).append(tool_a);
		paragraphContainer.append(editPanel);
	},
	bindControl: function(paragraphBox){
		var controlPanel = $("<div>");
		controlPanel.addClass("controlPanel tool-b");

		var edit = $("<a>");
		edit.attr("data-control", "edit");
		edit.append("編輯");
		editor.list.bindEdit(edit);

		var del = $("<a>");
		del.attr("data-control", "del");
		del.append("刪除");
		del.click(function(){
			paragraphBox.remove();
			editor.save();
		});
		
		//indent
		// var indent = $("<a>");
		// indent.attr("data-control", "indent");
		// indent.append("=>");
		// indent.click(function(event){
		
		// 	var listStyle = $(event.target).parent().next("ul");
		// 	listStyle.css("padding-left",parseInt(listStyle.css("padding-left"))+ 40);			
			
		// 	editor.save();
		// });
		
		//outdent
		// var outdent = $("<a>");
		// outdent.attr("data-control", "outdent");
		// outdent.append("<=");
		// outdent.click(function(event){
		// var listStyle = $(event.target).parent().next("ul");
		// 	listStyle.css("padding-left",parseInt(listStyle.css("padding-left"))- 40);
		// 	editor.save();
		// });
		
		// controlPanel.append(edit).append(del).append(outdent).append(indent);
		controlPanel.append(edit).append(del);
		paragraphBox.prepend(controlPanel);

	},
	bindEdit: function(edit){
		$(edit).bind("click", function(){
			var controlPanel = $(this).parents(".controlPanel");
			var paragraphContainer = $(this).parents(".paragraphContainer");
			editor.list.edit(paragraphContainer, controlPanel);
		});
	},
	pack: function(paragraphContainer){
		var list = new Object();
		
    list.type = "list";
    var elements = [];
    
    $(paragraphContainer).children('ul').children('li').each(function() {
    
      if ( $(this).html() ) {
        elements.push($(this).html());
      }
    });
    
    $(paragraphContainer).children('ul').each(function() {
  	list.style = $(paragraphContainer).children('ul').attr("class");    
    });
    
    list.content = elements;
		
		
		return list;
	}
};