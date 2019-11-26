$(function(){
    initRecommentFile();
});
function initRecommentFile(){
    $.post("/pact/findrecommentfile?pdId="+pdId, function (result) {
        var data = result.rows;
        file_upload_Recommend(data);
    });
}

//权益文件上传上传
function file_upload_Recommend(data){
    var preview = [];
    var previewConfig = [];
    for (var i = 0; i < data.length; i++) {
        preview[i]=data[i].prefFinename;
        var o = {};
        o.caption = data[i].prefFinename;
        o.size = "762980";
        o.key = data[i].idStr;
        o.url = "/uact/deletefile?fileid=key&type=1012-0002";//删除地址配置
        previewConfig[i] = o;
    }
    //初始化fileinput控件（第一次初始化）
    $("#fild-pd-recommend").fileinput({
        theme: "explorer",
        uploadUrl: "/uact/uploadfile?type=1012-0002", //上传的地址
        uploadExtraData:{pdId:pdId},
        minFileCount: 0,
        maxFileCount: 20,
        overwriteInitial: false,
        showUpload: true, //是否显示上传按钮
        showCaption: true,//是否显示标题
        showRemove :false,
        showBrowse:true,
        browseOnZoneClick:true,
        autoReplace:true,//是否替换
        validateInitialCount:true,
        allowedFileExtensions:['jpg', 'pdf', 'xls','png'],
        msgInvalidFileExtension:'上传文件类型错误"{name}".只能上传"{extensions}"类型的文件',
        initialPreview: preview,
        /*initialPreviewAsData: true, // defaults markup
        uploadExtraData: {
            img_key: "1000",
            img_keywords: "happy, nature",

        },*/
        initialPreviewConfig: previewConfig,
        /*initialPreviewConfig: [
            {caption: "Business 1.jpg", size: 762980, url: "/site/file-delete", key: 11},
            {caption: "Business 2.jpg", size: 823782, url: "/site/file-delete", key: 13, previewAsData: false},
            {caption: "PDF Sample.pdf", size: 8000, url: "/site/file-delete", key: 14, type: "pdf"},
            //{caption: "Lorem Ipsum.txt", type: "text", size: 1430, url: "/site/file-delete", key: 12},
            //{type: "video", size: 375000, filetype: "video/mp4", caption: "Krajee Sample.mp4", url: "/site/file-delete", key: 15},
        ],*/
        preferIconicPreview: true, // this will force thumbnails to display icons for following file extensions
        previewFileIcon:'<i class="glyphicon glyphicon-file"></i> &nbsp;',
        previewFileIconSettings: { // configure your icon file extensions
            //'doc': '<i class="fa fa-file-word-o text-primary" ><img src="/img/excel.png"/></i>',
            'xls': '<i class="fa fa-file-excel-o text-success"><img src="/img/excel.png"/></i>',
            //'ppt': '<i class="fa fa-file-powerpoint-o text-danger"><img src="/img/excel.png"/></i>',
            'pdf': '<i class="fa fa-file-pdf-o text-danger"><img src="/img/pdf.png"/></i>',
            //'zip': '<i class="fa fa-file-archive-o text-muted"></i>',
            //'htm': '<i class="fa fa-file-code-o text-info"></i>',
            //'txt': '<i class="fa fa-file-text-o text-info"><img src="/img/excel.png"/></i>',
            //'mov': '<i class="fa fa-file-movie-o text-warning"></i>',
            //'mp3': '<i class="fa fa-file-audio-o text-warning"></i>',
            // note for these file types below no extension determination logic
            // has been configured (the keys itself will be used as extensions)
            'jpg': '<i class="fa fa-file-photo-o text-danger"><img src="/img/jpg.png"/></i>',
            //'gif': '<i class="fa fa-file-photo-o text-muted"></i>',
            'png': '<i class="fa fa-file-photo-o text-primary"><img src="/img/jpg.png"/></i>'
        },
        previewFileExtSettings: { // configure the logic for determining icon file extensions
            'doc': function(ext) {
                return ext.match(/(doc|docx)$/i);
            },
            'xls': function(ext) {
                return ext.match(/(xls|xlsx)$/i);
            },
            'ppt': function(ext) {
                return ext.match(/(ppt|pptx)$/i);
            },
            'zip': function(ext) {
                return ext.match(/(zip|rar|tar|gzip|gz|7z)$/i);
            },
            'htm': function(ext) {
                return ext.match(/(htm|html)$/i);
            },
            'txt': function(ext) {
                return ext.match(/(txt|ini|csv|java|php|js|css)$/i);
            },
            'mov': function(ext) {
                return ext.match(/(avi|mpg|mkv|mov|mp4|3gp|webm|wmv)$/i);
            },
            'mp3': function(ext) {
                return ext.match(/(mp3|wav)$/i);
            },
        }
    }).on('fileclear', function(event) {
        console.log("fileclear");
    }).on('filecleared', function(event) {
        console.log("filecleared");
    }).on('fileloaded', function(event, file, previewId, index, reader) {
        console.log("fileloaded");
    }).on('filereset', function(event) {
        console.log("filereset");
    }).on('filepreremove', function(event, id, index) {
        console.log('id = ' + id + ', index = ' + index);
    }).on('fileremoved', function(event, id, index) {
        console.log('id = ' + id + ', index = ' + index);
    }).on('filepredelete', function(event, key, jqXHR, data) {
        //alert(9);
        /*$.ajax({
            type: "POST",
            cache:false,
            async : true,
            dataType : "json",
            url:  "/uact/deletefile",
            data: {fileid:key,type:'1012-0002'},
            success: function(data){
                console.log(data);
                $('#fild-pd-recommend').fileinput('reset');
            }
       });*/
    }).on('filedeleted', function(event, key, jqXHR, data) {
        console.log('Key = ' + key);
    }).on('filesuccessremove', function(event, id) {//上传成功后删除触发
        alert(id);
    }).on("fileuploaded", function(event, data, previewId, index) {
        console.log(data);
    });
}