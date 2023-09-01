// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: thread.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30004
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30004 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

@class Thread;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - ThreadRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
GPB_FINAL @interface ThreadRoot : GPBRootObject
@end

#pragma mark - Thread

typedef GPB_ENUM(Thread_FieldNumber) {
  Thread_FieldNumber_Tid = 1,
  Thread_FieldNumber_Type = 2,
  Thread_FieldNumber_Client = 5,
  Thread_FieldNumber_Nickname = 6,
  Thread_FieldNumber_Avatar = 7,
  Thread_FieldNumber_Content = 8,
  Thread_FieldNumber_Timestamp = 9,
  Thread_FieldNumber_UnreadCount = 10,
  Thread_FieldNumber_Topic = 11,
  Thread_FieldNumber_Extra = 20,
};

GPB_FINAL @interface Thread : GPBMessage

/** ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *tid;

/** 会话类型 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *type;

/** 来源客户端 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *client;

@property(nonatomic, readwrite, copy, null_resettable) NSString *nickname;

@property(nonatomic, readwrite, copy, null_resettable) NSString *avatar;

@property(nonatomic, readwrite, copy, null_resettable) NSString *content;

@property(nonatomic, readwrite, copy, null_resettable) NSString *timestamp;

@property(nonatomic, readwrite) int32_t unreadCount;

/** 主题：消息接收者为订阅此topic的人 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *topic;

/**
 *
 * 扩展字段
 **/
@property(nonatomic, readwrite, copy, null_resettable) NSString *extra;

@end

#pragma mark - ThreadList

typedef GPB_ENUM(ThreadList_FieldNumber) {
  ThreadList_FieldNumber_ListArray = 1,
};

/**
 * 列表
 **/
GPB_FINAL @interface ThreadList : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<Thread*> *listArray;
/** The number of items in @c listArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger listArray_Count;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
