/*var map = new BMap.Map("container",{
    enableMapClick: false
});*/
var map = new BMap.Map("container");
// 创建地图实例  
var point = new BMap.Point(118.093848,24.484882);
var start = point;
var end;
// 创建点坐标  
map.centerAndZoom(point, 14);
// 初始化地图，设置中心点坐标和地图级别  
map.addControl(new BMap.MapTypeControl({
		mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));
map.addControl(new BMap.NavigationControl());    
map.addControl(new BMap.ScaleControl());    
map.addControl(new BMap.OverviewMapControl());    
	  
map.setCurrentCity("厦门");          // 设置地图显示的城市 此项是必须设置的
map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

function G(id) {
    return document.getElementById(id);
}

var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
    {"input" : "suggestId"
    ,"location" : map
});
