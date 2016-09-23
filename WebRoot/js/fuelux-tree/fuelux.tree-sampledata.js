var DataSourceTree = function(options) {
	this._data 	= options.data;
	this._delay = options.delay;
}

DataSourceTree.prototype.data = function(options, callback) {
	var self = this;
	var $data = null;

	if(!("name" in options) && !("type" in options)){
		$data = this._data;//the root tree
		callback({ data: $data });
		return;
	}
	else if("type" in options && options.type == "folder") {
		if("additionalParameters" in options && "children" in options.additionalParameters)
			$data = options.additionalParameters.children;
		else $data = {}//no data
	}
	
	if($data != null)//this setTimeout is only for mimicking some random delay
		setTimeout(function(){callback({ data: $data });} , parseInt(Math.random() * 500) + 200);

	//we have used static data here
	//but you can retrieve your data dynamically from a server using ajax call
	//checkout examples/treeview.html and examples/treeview.js for more info
};

var tree_data = {
	'foodmart' : {name: '温度传感器', type: 'folder'},
	'seating' : {name: '压力传感器', type: 'folder'},
	'flowers' : {name: '水位传感器', type: 'folder'}
}
tree_data['foodmart']['additionalParameters'] = {
	'children' : {
		'40006' : {name: '40006', type: 'item'},
		'40005' : {name: '40005', type: 'item'},
		'40004' : {name: '40004', type: 'item'},
		'40003' : {name: '40003', type: 'item'}
	}
}
tree_data['seating']['additionalParameters'] = {
	'children' : {
		'60001' : {name: '60001', type: 'item'},
		'60002' : {name: '60002', type: 'item'},
		'60003' : {name: '60003', type: 'item'}
	}
}
tree_data['flowers']['additionalParameters'] = {
	'children' : {
		'50001' : {name: '50001', type: 'item'},
		'50002' : {name: '50002', type: 'item'},
		'50003' : {name: '50003', type: 'item'}
	}
}

var treeDataSource = new DataSourceTree({data: tree_data});


var tree_data_2 = {
	'documents' : {name: 'Documents', type: 'folder', 'icon-class':'green'}	,
	'pictures' : {name: 'Pictures', type: 'folder', 'icon-class':'red'}	,
	'music' : {name: 'Music', type: 'folder', 'icon-class':'orange'}	,
	'videos' : {name: 'Videos', type: 'folder', 'icon-class':'blue'}	,
	'contacts' : {name: 'Contacts', type: 'folder'}	,
	'sample-txt' : {name: '<i class="fa fa-book"></i> Sample.txt', type: 'item'},
	'sample-zip' : {name: '<i class="fa fa-archive"></i> Sample.zip', type: 'item'},
	'sample-html' : {name: '<i class="fa fa-book"></i> Sample.html', type: 'item'}
}

tree_data_2['documents']['additionalParameters'] = {
	'children' : [
		{name: '<i class="fa fa-file-text"></i> document1.pdf', type: 'item'},
		{name: '<i class="fa fa-file-text"></i> document2.doc', type: 'item'},
		{name: '<i class="fa fa-file-text"></i> document3.doc', type: 'item'},
		{name: '<i class="fa fa-file-text"></i> document4.pdf', type: 'item'}
	]
}

tree_data_2['pictures']['additionalParameters'] = {
	'children' : {
		'camera' : {name: 'Camera', type: 'folder', 'icon-class':'pink'},
		'picasa' : {name: 'Picasa', type: 'folder', 'icon-class':'pink'}
	}
}
tree_data_2['pictures']['additionalParameters']['children']['camera']['additionalParameters'] = {
	'children' : [
		{name: '<i class="fa fa-picture-o"></i> photo1.jpg', type: 'item'},
		{name: '<i class="fa fa-picture-o"></i> photo2.jpg', type: 'item'},
		{name: '<i class="fa fa-picture-o"></i> photo3.jpg', type: 'item'},
		{name: '<i class="fa fa-picture-o"></i> photo4.jpg', type: 'item'}
	]
}
tree_data_2['pictures']['additionalParameters']['children']['picasa']['additionalParameters'] = {
	'children' : [
		{name: '<i class="fa fa-picture-o"></i> photo1.jpg', type: 'item'},
		{name: '<i class="fa fa-picture-o"></i> photo2.jpg', type: 'item'},
		{name: '<i class="fa fa-picture-o"></i> photo3.jpg', type: 'item'},
		{name: '<i class="fa fa-picture-o"></i> photo4.jpg', type: 'item'},
		{name: '<i class="fa fa-picture-o"></i> photo5.jpg', type: 'item'}
	]
}

tree_data_2['music']['additionalParameters'] = {
	'children' : [
		{name: '<i class="fa fa-music"></i> song1.mp3', type: 'item'},
		{name: '<i class="fa fa-music"></i> song2.mp3', type: 'item'},
		{name: '<i class="fa fa-music"></i> song3.mp3', type: 'item'},
		{name: '<i class="fa fa-music"></i> song4.mp3', type: 'item'},
		{name: '<i class="fa fa-music"></i> song5.mp3', type: 'item'},
		{name: '<i class="fa fa-music"></i> song6.mp3', type: 'item'}
	]
}
console.info("tree_data_2");
tree_data_2['videos']['additionalParameters'] = {
	'children' : [
		{name: '<i class="fa fa-film"></i> movie1.wmv', type: 'item'},
		{name: '<i class="fa fa-film"></i> movie2.wmv', type: 'item'},
		{name: '<i class="fa fa-film"></i> movie3.avi', type: 'item'},
		{name: '<i class="fa fa-film"></i> movie4.mp4', type: 'item'},
		{name: '<i class="fa fa-film"></i> movie5.avi', type: 'item'}
	]
}

tree_data_2['contacts']['additionalParameters'] = {
	'children' : [
		{name: '<i class="fa fa-book"></i> address.zip', type: 'item'},
		{name: '<i class="fa fa-envelope"></i> email.zip', type: 'item'},
		{name: '<i class="fa fa-phone"></i> phone.zip', type: 'item'}
	]
}
var treeDataSource2 = new DataSourceTree({data: tree_data_2});

var tree_data_3 = {
	'weekly-reports' : {name: 'Weekly Reports', type: 'folder'},
	'employees' : {name: 'Employees', type: 'folder'},
	'departments' : {name: 'Departments', type: 'item'},
	'benefits' : {name: 'Benefits', type: 'item'}
}
tree_data_3['weekly-reports']['additionalParameters'] = {
	'children' : {
		'company-sales' : {name: 'Company Sales', type: 'item'},
		'employee-sales' : {name: 'Employee Sales', type: 'item'},
		'foodmart-sales' : {name: 'Foodmart Sales', type: 'item'},
		'product-catalog' : {name: 'Product Catalog', type: 'item'},
		'productline-sales' : {name: 'Product Line Sales', type: 'item'},
		'discounted-sales' : {name: 'Discounted sales', type: 'item'},
		'sales-detail' : {name: 'Sales Order Detail', type: 'item'}
	}
}
tree_data_3['employees']['additionalParameters'] = {
	'children' : {
		'cooks' : {name: 'Cooks', type: 'item'},
		'assistants' : {name: 'Assistants', type: 'item'},
		'waters' : {name: 'Waiters', type: 'item'}
	}
}

var treeDataSource3 = new DataSourceTree({data: tree_data_3});