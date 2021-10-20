/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.206.128mongodb
 Source Server Type    : MongoDB
 Source Server Version : 40406
 Source Host           : 192.168.206.128:27017
 Source Schema         : myapp

 Target Server Type    : MongoDB
 Target Server Version : 40406
 File Encoding         : 65001

 Date: 02/08/2021 21:00:22
*/


// ----------------------------
// Collection structure for collect
// ----------------------------
db.getCollection("collect").drop();
db.createCollection("collect");

// ----------------------------
// Documents of collect
// ----------------------------
db.getCollection("collect").insert([ {
    _id: ObjectId("60d8889a68d44218ee2d8b9c"),
    vid: NumberInt("18"),
    uid: NumberLong("6"),
    _class: "io.renren.modules.app.entity.CollectEntity"
} ]);

// ----------------------------
// Collection structure for video
// ----------------------------
db.getCollection("video").drop();
db.createCollection("video");

// ----------------------------
// Documents of video
// ----------------------------
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006805"),
    vid: NumberInt("1"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006806"),
    vid: NumberInt("2"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006807"),
    vid: NumberInt("3"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006808"),
    vid: NumberInt("4"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006809"),
    vid: NumberInt("5"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c00680a"),
    vid: NumberInt("6"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c00680b"),
    vid: NumberInt("7"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c00680c"),
    vid: NumberInt("8"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c00680d"),
    vid: NumberInt("9"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c00680e"),
    vid: NumberInt("10"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c00680f"),
    vid: NumberInt("11"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006810"),
    vid: NumberInt("12"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006811"),
    vid: NumberInt("13"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006812"),
    vid: NumberInt("14"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006813"),
    vid: NumberInt("15"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006814"),
    vid: NumberInt("16"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006815"),
    vid: NumberInt("17"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006816"),
    vid: NumberInt("18"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("1"),
    collectnum: NumberInt("1"),
    flagLike: true,
    flagCollect: true,
    _class: "io.renren.modules.app.entity.VideoSocialEntity"
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006817"),
    vid: NumberInt("19"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006818"),
    vid: NumberInt("20"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c006819"),
    vid: NumberInt("21"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c00681a"),
    vid: NumberInt("22"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c00681b"),
    vid: NumberInt("23"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c00681c"),
    vid: NumberInt("24"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c00681d"),
    vid: NumberInt("25"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);
db.getCollection("video").insert([ {
    _id: ObjectId("60d888615a1c00009c00681e"),
    vid: NumberInt("26"),
    commentnum: NumberInt("0"),
    likenum: NumberInt("0"),
    collectnum: NumberInt("0"),
    flagLike: false,
    flagCollect: false
} ]);