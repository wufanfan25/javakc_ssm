var setting = {
    view: {
        dblClickExpand: false,
        selectedMulti:false  //按住ctrl不可多选
    },
    data: {
        simpleData: {
            enable: true
        }
    },
    callback: {
        onClick: onClick
    }
};

function onClick(e, treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj("tree");
        nodes = zTree.getSelectedNodes();
        $("#selectnodeId").attr("value",nodes[0].id)
        $("#menuBtn").attr("value",parentName(nodes[0]))
}

//用于生成选中节点的所有父节点名称
function parentName(treenode) {
    if (treenode == null) return "";
    if (treenode.level == 0) return "";
    var thisName = treenode.name;
    var parentNode = treenode.getParentNode();
    if (parentNode.level != 0) {
        thisName = parentName(parentNode) + "/" + thisName;
    }
    return thisName;
}

function showMenu() {
    var typeObj = $("#menuBtn");
    var typeOffset = $("#menuBtn").offset();
    $("#menuContent").css({left:typeOffset.left + "px", top:typeOffset.top + typeObj.outerHeight() + "px"}).slideDown("fast");

    $("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
    $("#menuContent").fadeOut("fast");
    $("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
    if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
        hideMenu();
    }
}

$(document).ready(function(){
    $.get(root + '/materialtype/query.do', function (zNodes) {
        zTree = $.fn.zTree.init($("#tree"), setting, zNodes);
    }, 'json');
});