User.create!([
  {first_name: "Admin name", last_name: "Admin last_name", email: "test@test.cl", password: "test11"}
  ])


Category.create!([
  {title: "Comic"},
  {title: "Readme"},
  {title: "Documentation"},
  {title: "Funny"}
])
Document.create!([
  {title: "Deadpool 2452", text: "#Markdown Format\r\n\r\n![Markdown Banner](http://puu.sh/nocCg/2082ca22e8.png)\r\n\r\nMarkdown is a popular **plain-text** format for web authoring. It was designed to be *easily readable* and *portable*. For now I've included a link to the top right of every article edit box that leads to a good [feature run-down](https://help.github.com/articles/basic-writing-and-formatting-syntax/). Our variant of markdown has html disabled for security reasons. If you want a WYSIWYG editor, I would recommend checking out [Dillinger](http://dillinger.io/) which has a great built-in preview pane for markdown.\r\n\r\n#Images\r\n\r\n1. Thumbnails look best if they are 675 x 675 pixels, with the main focus of the image in the center (the thumbnail is cropped and centered based on screen size).\r\n2. Image embeds look best if they are at least 900 pixels wide (full article width) and 200-400 pixels tall.\r\n3. You should use a reliable image storage location for all images. If you need access to our private FTP just let Frosthaven know. Puush is *okay* for now, but we'll want to move away from relying on puush eventually.\r\n\r\n#Advanced Image Formatting\r\n\r\nYou can float images to the left or right of your page content by starting a sentence with one of the following image codes:\r\n\r\n```\r\nfloating an image left or right with description:\r\n\r\n![deadpool](https://3.bp.blogspot.com/-Jp6vUWV3M1M/Vz_PIr4uKVI/AAAAAAAAAAg/0fqF_v_XZCAbZvYjwhVQ3aJwSHMWVvAMQCKgB/s400/13-600x338.jpeg \"fig-left:Deadpool wants to be your valentine!\")\r\n\r\n\r\nand without description:\r\n\r\n![harley](https://s-media-cache-ak0.pinimg.com/736x/7d/95/97/7d95974e8db38ae81385d0c0519ca732.jpg \"fig-left\")\r\n![r2d2](http://puu.sh/nu5yn/4ea17b6b60.png \"fig-right\")\r\n```\r\n\r\nYou can view advanced formatting in action by [clicking here](http://staging.fortiscoregaming.com/article/view/2016/03/03/78/new-floater-images-for-writers)\r\n\r\n#Advanced Audio/Video Embedding\r\n\r\nThese only require normal link syntax, with the code word \"embed\" applied as the title\r\n\r\nNote: Soundcloud embeds require the track ID. You can get the ID by clicking share > embed from the soundcloud player page and looking for the numbers in the embed code.\r\n\r\n```\r\n[Soundcloud](https://api.soundcloud.com/tracks/248602237 \"embed\")\r\n\r\n[Youtube](https://youtu.be/MA2t_WEa8ww?t=1578 \"embed\")\r\n\r\n[Twitch](http://www.twitch.tv/maximilian_dood \"embed\")\r\n```\r\n\r\nYou can view the custom audio/video embedding in action by [clicking here](http://staging.fortiscoregaming.com/article/view/2016/02/26/66/custom-media-embedding-tutorial).\r\n\r\n#Still confused?\r\n\r\nI've saved this very article in it's original markdown format. You can [view it here](http://cdn.fortiscoregaming.com/markdown-sample.md) to compare!"},
  {title: "Readme.md", text: "THIS APP IS COOL BEANS!\r\n\r\n![](https://www.socialtools.me/blog/wp-content/uploads/2015/08/cool-beans.gif)"},
  {title: "Funny GIFs", text: "# BEST GIFs IN THE INTERNET\r\n\r\n> Rick & Morty\r\n\r\n* ![](https://media.giphy.com/media/3o85xuO1siCT147FrG/giphy.gif)\r\n\r\n* ![](https://media.tenor.co/images/b6d7f5c907cdc13c1e1ae0f6be7976df/tenor.gif)\r\n\r\n> Shrek\r\n\r\n* ![](https://media.tenor.co/images/e238bc3a36c14f726173f87256010f9d/tenor.gif)\r\n"},
  {title: "Example Readme (Web Project)", text: "# README\r\n\r\n* Ruby version: 5.0.2\r\n\r\n* Rails commands called\r\n\r\n        rails generate scaffold Person first_name:string last_name:string email:string\r\n        rails generate scaffold Course title:string code:string person:references\r\n        rails generate scaffold Enrollment person:references course:references\r\n        rails db:migrate\r\n\r\n        // Use teacher instead of person in Course controllers\r\n        rails generate scaffold_controller Course title code teacher --force\r\n\r\n        // Use student instead of person in Enrollment controllers\r\n        rails generate scaffold_controller Enrollment student course --force"}
])
# 
# DocumentAccess.create!([
#   {document_id: 1, user_id: 1},
#   {document_id: 2, user_id: 1},
#   {document_id: 3, user_id: 1},
#   {document_id: 4, user_id: 1}
#   ])

DocumentCategory.create!([
  {document_id: 2, category_id: 2},
  {document_id: 2, category_id: 3},
  {document_id: 3, category_id: 4},
  {document_id: 4, category_id: 2},
  {document_id: 1, category_id: 1},
  {document_id: 1, category_id: 3}

])
