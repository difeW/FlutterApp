class ModalDetailProduct {
  Prod? prod;

  ModalDetailProduct({this.prod});

  ModalDetailProduct.fromJson(Map<String, dynamic> json) {
    prod = json['prod'] != null ? new Prod.fromJson(json['prod']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.prod != null) {
      data['prod'] = this.prod!.toJson();
    }
    return data;
  }
}

class Prod {
  Conn? conn;
  Ram? ram;
  Rom? rom;
  Struct? struct;
  String? id;
  Battery? battery;
  CPU? cPU;
  Cam? cam;
  String? categoryName;
  String? color;
  int? currentOrder;
  String? description;
  Graphic? graphic;
  bool? isDelete;
  int? mSRP;
  String? note;
  OS? oS;
  String? picture;
  String? productDetail;
  int? productId;
  String? productName;
  int? rawPrice;
  int? reorderLevel;
  Screen? screen;
  Sound? sound;
  String? special;
  String? type;
  int? unitInOrder;
  int? unitPrice;
  String? version;
  int? view;
  int? sold;

  Prod(
      {this.conn,
      this.ram,
      this.rom,
      this.struct,
      this.id,
      this.battery,
      this.cPU,
      this.cam,
      this.categoryName,
      this.color,
      this.currentOrder,
      this.description,
      this.graphic,
      this.isDelete,
      this.mSRP,
      this.note,
      this.oS,
      this.picture,
      this.productDetail,
      this.productId,
      this.productName,
      this.rawPrice,
      this.reorderLevel,
      this.screen,
      this.sound,
      this.special,
      this.type,
      this.unitInOrder,
      this.unitPrice,
      this.version,
      this.view,
      this.sold});

  Prod.fromJson(Map<String, dynamic> json) {
    conn = json['Conn'] != null ? new Conn.fromJson(json['Conn']) : null;
    ram = json['Ram'] != null ? new Ram.fromJson(json['Ram']) : null;
    rom = json['Rom'] != null ? new Rom.fromJson(json['Rom']) : null;
    struct =
        json['Struct'] != null ? new Struct.fromJson(json['Struct']) : null;
    id = json['id'];
    battery =
        json['Battery'] != null ? new Battery.fromJson(json['Battery']) : null;
    cPU = json['CPU'] != null ? new CPU.fromJson(json['CPU']) : null;
    cam = json['Cam'] != null ? new Cam.fromJson(json['Cam']) : null;
    categoryName = json['CategoryName'];
    color = json['Color'];
    currentOrder = json['CurrentOrder'];
    description = json['Description'];
    graphic =
        json['Graphic'] != null ? new Graphic.fromJson(json['Graphic']) : null;
    isDelete = json['IsDelete'];
    mSRP = json['MSRP'];
    note = json['Note'];
    oS = json['OS'] != null ? new OS.fromJson(json['OS']) : null;
    picture = json['Picture'];
    productDetail = json['ProductDetail'];
    productId = json['ProductId'];
    productName = json['ProductName'];
    rawPrice = json['RawPrice'];
    reorderLevel = json['ReorderLevel'];
    screen =
        json['Screen'] != null ? new Screen.fromJson(json['Screen']) : null;
    sound = json['Sound'] != null ? new Sound.fromJson(json['Sound']) : null;
    special = json['Special'];
    type = json['Type'];
    unitInOrder = json['UnitInOrder'];
    unitPrice = json['UnitPrice'];
    version = json['Version'];
    view = json['View'];
    sold = json['sold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.conn != null) {
      data['Conn'] = this.conn!.toJson();
    }
    if (this.ram != null) {
      data['Ram'] = this.ram!.toJson();
    }
    if (this.rom != null) {
      data['Rom'] = this.rom!.toJson();
    }
    if (this.struct != null) {
      data['Struct'] = this.struct!.toJson();
    }
    data['id'] = this.id;
    if (this.battery != null) {
      data['Battery'] = this.battery!.toJson();
    }
    if (this.cPU != null) {
      data['CPU'] = this.cPU!.toJson();
    }
    if (this.cam != null) {
      data['Cam'] = this.cam!.toJson();
    }
    data['CategoryName'] = this.categoryName;
    data['Color'] = this.color;
    data['CurrentOrder'] = this.currentOrder;
    data['Description'] = this.description;
    if (this.graphic != null) {
      data['Graphic'] = this.graphic!.toJson();
    }
    data['IsDelete'] = this.isDelete;
    data['MSRP'] = this.mSRP;
    data['Note'] = this.note;
    if (this.oS != null) {
      data['OS'] = this.oS!.toJson();
    }
    data['Picture'] = this.picture;
    data['ProductDetail'] = this.productDetail;
    data['ProductId'] = this.productId;
    data['ProductName'] = this.productName;
    data['RawPrice'] = this.rawPrice;
    data['ReorderLevel'] = this.reorderLevel;
    if (this.screen != null) {
      data['Screen'] = this.screen!.toJson();
    }
    if (this.sound != null) {
      data['Sound'] = this.sound!.toJson();
    }
    data['Special'] = this.special;
    data['Type'] = this.type;
    data['UnitInOrder'] = this.unitInOrder;
    data['UnitPrice'] = this.unitPrice;
    data['Version'] = this.version;
    data['View'] = this.view;
    data['sold'] = this.sold;
    return data;
  }
}

class Conn {
  List<String>? blutooth;
  List<String>? gPS;
  String? other;
  String? phoneJack;
  String? sim;
  String? special;
  String? type;
  List<String>? wifi;
  String? wirelessCard;

  Conn(
      {this.blutooth,
      this.gPS,
      this.other,
      this.phoneJack,
      this.sim,
      this.special,
      this.type,
      this.wifi,
      this.wirelessCard});

  Conn.fromJson(Map<String, dynamic> json) {
    blutooth = json['Blutooth'].cast<String>();
    gPS = json['GPS'].cast<String>();
    other = json['Other'];
    phoneJack = json['PhoneJack'];
    sim = json['Sim'];
    special = json['Special'];
    type = json['Type'];
    wifi = json['Wifi'].cast<String>();
    wirelessCard = json['WirelessCard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Blutooth'] = this.blutooth;
    data['GPS'] = this.gPS;
    data['Other'] = this.other;
    data['PhoneJack'] = this.phoneJack;
    data['Sim'] = this.sim;
    data['Special'] = this.special;
    data['Type'] = this.type;
    data['Wifi'] = this.wifi;
    data['WirelessCard'] = this.wirelessCard;
    return data;
  }
}

class Ram {
  int? capacity;
  int? maxRam;
  String? name;
  Null? ram;
  int? slots;
  int? speed;
  String? type;

  Ram(
      {this.capacity,
      this.maxRam,
      this.name,
      this.ram,
      this.slots,
      this.speed,
      this.type});

  Ram.fromJson(Map<String, dynamic> json) {
    capacity = json['Capacity'];
    maxRam = json['MaxRam'];
    name = json['Name'];
    ram = json['Ram'];
    slots = json['Slots'];
    speed = json['Speed'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Capacity'] = this.capacity;
    data['MaxRam'] = this.maxRam;
    data['Name'] = this.name;
    data['Ram'] = this.ram;
    data['Slots'] = this.slots;
    data['Speed'] = this.speed;
    data['Type'] = this.type;
    return data;
  }
}

class Rom {
  int? capacity;
  int? maxRom;
  String? type;

  Rom({this.capacity, this.maxRom, this.type});

  Rom.fromJson(Map<String, dynamic> json) {
    capacity = json['Capacity'];
    maxRom = json['MaxRom'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Capacity'] = this.capacity;
    data['MaxRom'] = this.maxRom;
    data['Type'] = this.type;
    return data;
  }
}

class Struct {
  String? design;
  String? high;
  String? long;
  String? martirial;
  String? weight;
  String? wide;

  Struct(
      {this.design,
      this.high,
      this.long,
      this.martirial,
      this.weight,
      this.wide});

  Struct.fromJson(Map<String, dynamic> json) {
    design = json['Design'];
    high = json['High'];
    long = json['Long'];
    martirial = json['Martirial'];
    weight = json['Weight'];
    wide = json['Wide'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Design'] = this.design;
    data['High'] = this.high;
    data['Long'] = this.long;
    data['Martirial'] = this.martirial;
    data['Weight'] = this.weight;
    data['Wide'] = this.wide;
    return data;
  }
}

class Battery {
  int? capacity;
  String? type;
  List<String>? technology;
  int? charge;

  Battery({this.capacity, this.type, this.technology, this.charge});

  Battery.fromJson(Map<String, dynamic> json) {
    capacity = json['Capacity'];
    type = json['Type'];
    technology = json['Technology'].cast<String>();
    charge = json['Charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Capacity'] = this.capacity;
    data['Type'] = this.type;
    data['Technology'] = this.technology;
    data['Charge'] = this.charge;
    return data;
  }
}

class CPU {
  String? name;
  String? genth;
  int? core;
  int? thread;
  double? baseSpeed;
  String? maxSpeed;
  String? cache;

  CPU(
      {this.name,
      this.genth,
      this.core,
      this.thread,
      this.baseSpeed,
      this.maxSpeed,
      this.cache});

  CPU.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    genth = json['Genth'];
    core = json['Core'];
    thread = json['Thread'];
    baseSpeed = json['BaseSpeed'];
    maxSpeed = json['MaxSpeed'];
    cache = json['Cache'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Genth'] = this.genth;
    data['Core'] = this.core;
    data['Thread'] = this.thread;
    data['BaseSpeed'] = this.baseSpeed;
    data['MaxSpeed'] = this.maxSpeed;
    data['Cache'] = this.cache;
    return data;
  }
}

class Cam {
  String? webcam;
  String? fCamRes;
  String? bCamRes;
  String? flash;
  List<String>? video;
  List<String>? special;

  Cam(
      {this.webcam,
      this.fCamRes,
      this.bCamRes,
      this.flash,
      this.video,
      this.special});

  Cam.fromJson(Map<String, dynamic> json) {
    webcam = json['Webcam'];
    fCamRes = json['FCamRes'];
    bCamRes = json['BCamRes'];
    flash = json['Flash'];
    video = json['Video'].cast<String>();
    special = json['Special'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Webcam'] = this.webcam;
    data['FCamRes'] = this.fCamRes;
    data['BCamRes'] = this.bCamRes;
    data['Flash'] = this.flash;
    data['Video'] = this.video;
    data['Special'] = this.special;
    return data;
  }
}

class Graphic {
  String? nameGPU;
  String? core;

  Graphic({this.nameGPU, this.core});

  Graphic.fromJson(Map<String, dynamic> json) {
    nameGPU = json['NameGPU'];
    core = json['Core'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NameGPU'] = this.nameGPU;
    data['Core'] = this.core;
    return data;
  }
}

class OS {
  String? name;
  String? version;

  OS({this.name, this.version});

  OS.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    version = json['Version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Version'] = this.version;
    return data;
  }
}

class Screen {
  String? resolution;
  String? size;
  int? hZ;
  String? maxBright;
  String? special;
  String? technology;

  Screen(
      {this.resolution,
      this.size,
      this.hZ,
      this.maxBright,
      this.special,
      this.technology});

  Screen.fromJson(Map<String, dynamic> json) {
    resolution = json['Resolution'];
    size = json['Size'];
    hZ = json['HZ'];
    maxBright = json['MaxBright'];
    special = json['Special'];
    technology = json['Technology'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Resolution'] = this.resolution;
    data['Size'] = this.size;
    data['HZ'] = this.hZ;
    data['MaxBright'] = this.maxBright;
    data['Special'] = this.special;
    data['Technology'] = this.technology;
    return data;
  }
}

class Sound {
  List<String>? technology;

  Sound({this.technology});

  Sound.fromJson(Map<String, dynamic> json) {
    technology = json['Technology'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Technology'] = this.technology;
    return data;
  }
}
