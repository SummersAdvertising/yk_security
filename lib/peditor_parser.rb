#encoding: utf-8
module PeditorParser
  include ActionView::Helpers
  include ActionView::Context
  # 擴充基本功能：
  # 1.抓圖 - done
  # 2.抓字 - done
  # 3. HTML 符合 google micro data 標註 找一種通用的來做標記
  def parse_peditor

    unless self.article.content.blank?
      article = JSON.parse(self.article.content)
      
      content_tag(:section, self.article.content ,class: 'text text-show',id: 'articleBody', itemprop: 'articleBody') do 
        
        article.each do | peditor_part |
          case peditor_part['type']
            when 'p'
              concat parse_peditor_p(peditor_part)
            when 'img'
              concat parse_peditor_img(peditor_part)
            when 'list'
              concat parse_peditor_list(peditor_part)
            when 'video'
              concat parse_peditor_video(peditor_part)
            else
          end # end case 
        end # end each

      end
    else

    end

  end

  def parse_peditor_p(peditor_part)

    content = peditor_part['content'].gsub(/[\n\r]/,"<br>\n")
    # content = simple_format(peditor_part['content'])

    # set content class
    content_class = 'part'
    unless peditor_part['fontClass'].blank?
      content_class = peditor_part['fontClass']
    end # end set content class
    
    # if set link
    unless peditor_part['link'].blank?
      content_tag(:div, "",class: '', data: { type: 'p'}, itemprop: 'text') do 
        concat( content_tag(:p, link_to(content.html_safe, peditor_part['link'] ) ,class: content_class) )
      end
    else
      content_tag(:div, "",class: '', data: { type: 'p'}, itemprop: 'text') do 
        concat( content_tag(:p, content.html_safe ,class: content_class) )
      end
    end
  end

  def parse_peditor_img(peditor_part)
    content_tag(:div, "" ,class: '', data: { type: 'img'}) do 
      concat( image_tag( peditor_part['path'] , alt: peditor_part['id'], title: peditor_part['id'], itemprop: 'image') )
    end
  end

  def parse_peditor_video(peditor_part)
    content_tag(:div, "" ,class: '', data: { type: 'video'}) do 
      content_tag(:iframe, nil, src: peditor_part['embedcode'], class: 'embed-responsive-item', itemprop: 'video')
    end
  end

  def parse_peditor_list(peditor_part)
    li_items = peditor_part['content']
    css_class = peditor_part['style']

    content_tag(:div, "" ,class: '', data: { type: 'list'}, itemprop: 'text') do 
      content_tag(:ul, class: css_class) do
        li_items.each do |item|
          concat content_tag(:li, item)
        end
      end
    end
  end

  def fetching_for_meta(length_limit=100)
    
    begin
      meta = ''
      unless self.article.content.blank?
        article = JSON.parse(self.article.content)
        article.each do | peditor_part |
          break if meta.length > length_limit
          next if peditor_part['type'] != 'p'
          
          meta += peditor_part['content']
            
        end # end of article loop
      end # end of blank check

      return meta

    rescue
      return 'fetch error.'
    end  
  end
  
  def fetching_all_p
    begin
      text = ''
      unless self.article.content.blank?
        article = JSON.parse(self.article.content)
        article.each do | peditor_part |
          next if peditor_part['type'] != 'p'
          
          text += peditor_part['content'].gsub(/[\n\r]/,"<br>\n")
            
        end # end of article loop
      end # end of blank check

      return text.html_safe

    rescue
      return 'fetch error.'
    end  
  end

  def fetching_first_img_path
    return fetching_all_img_path.first
  end

  def fetching_first_img_tag
    img_path = fetching_all_img_path.first
    unless img_path.blank?
      return image_tag( img_path )
    end
    return ''
  end

  def fetching_all_img_path
    begin
      all_img = Array.new()
      # [{"type":"img","id":"23","path":"/uploads/20/23-peditor-__________.jpg"}]
      unless self.article.content.blank?
        article = JSON.parse(self.article.content)
        article.each do | peditor_part |
          next if peditor_part['type'] != 'img'
          all_img.push(peditor_part['path'])  
        end # end of article loop
      end # end of blank check

      return all_img

    rescue
      return 'fetch error.'
    end  
  end
end