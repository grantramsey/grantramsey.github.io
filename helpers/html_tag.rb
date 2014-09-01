# -*- encoding : utf-8 -*-

module HtmlTag
  def cc_html(options = {}, &blk)
    attrs = options.map { |(k, v)| " #{h k}='#{h v}'" }.join('')
    [ "<!--[if lt IE 7 ]> <html#{attrs} class='no-js ie6'> <![endif]-->",
      "<!--[if IE 7 ]>    <html#{attrs} class='no-js ie7'> <![endif]-->",
      "<!--[if IE 8 ]>    <html#{attrs} class='no-js ie8'> <![endif]-->",
      "<!--[if IE 9 ]>    <html#{attrs} class='no-js ie9'> <![endif]-->",
      "<!--[if (gt IE 9)|!(IE)]><!--> <html#{attrs} class='no-js'> <!--<![endif]-->",
      capture_haml(&blk).strip,
      "</html>"
    ].join("\n")
  end
end
