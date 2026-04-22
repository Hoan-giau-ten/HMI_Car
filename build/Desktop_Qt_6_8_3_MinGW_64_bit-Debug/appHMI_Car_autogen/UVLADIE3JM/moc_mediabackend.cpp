/****************************************************************************
** Meta object code from reading C++ file 'mediabackend.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.8.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../src/mediabackend.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mediabackend.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.8.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN12MediaBackendE_t {};
} // unnamed namespace


#ifdef QT_MOC_HAS_STRINGDATA
static constexpr auto qt_meta_stringdata_ZN12MediaBackendE = QtMocHelpers::stringData(
    "MediaBackend",
    "trackChanged",
    "",
    "playingChanged",
    "progressChanged",
    "updateProgress",
    "togglePlayPause",
    "nextTrack",
    "prevTrack",
    "playTrack",
    "index",
    "songTitle",
    "songArtist",
    "isPlaying",
    "progress",
    "positionTime",
    "durationTime"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA

Q_CONSTINIT static const uint qt_meta_data_ZN12MediaBackendE[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       6,   72, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   62,    2, 0x06,    7 /* Public */,
       3,    0,   63,    2, 0x06,    8 /* Public */,
       4,    0,   64,    2, 0x06,    9 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       5,    0,   65,    2, 0x08,   10 /* Private */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       6,    0,   66,    2, 0x02,   11 /* Public */,
       7,    0,   67,    2, 0x02,   12 /* Public */,
       8,    0,   68,    2, 0x02,   13 /* Public */,
       9,    1,   69,    2, 0x02,   14 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,   10,

 // properties: name, type, flags, notifyId, revision
      11, QMetaType::QString, 0x00015001, uint(0), 0,
      12, QMetaType::QString, 0x00015001, uint(0), 0,
      13, QMetaType::Bool, 0x00015001, uint(1), 0,
      14, QMetaType::Double, 0x00015001, uint(2), 0,
      15, QMetaType::QString, 0x00015001, uint(2), 0,
      16, QMetaType::QString, 0x00015001, uint(2), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject MediaBackend::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_ZN12MediaBackendE.offsetsAndSizes,
    qt_meta_data_ZN12MediaBackendE,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_tag_ZN12MediaBackendE_t,
        // property 'songTitle'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'songArtist'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'isPlaying'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'progress'
        QtPrivate::TypeAndForceComplete<double, std::true_type>,
        // property 'positionTime'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'durationTime'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<MediaBackend, std::true_type>,
        // method 'trackChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'playingChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'progressChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'updateProgress'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'togglePlayPause'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'nextTrack'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'prevTrack'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'playTrack'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>
    >,
    nullptr
} };

void MediaBackend::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<MediaBackend *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->trackChanged(); break;
        case 1: _t->playingChanged(); break;
        case 2: _t->progressChanged(); break;
        case 3: _t->updateProgress(); break;
        case 4: _t->togglePlayPause(); break;
        case 5: _t->nextTrack(); break;
        case 6: _t->prevTrack(); break;
        case 7: _t->playTrack((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _q_method_type = void (MediaBackend::*)();
            if (_q_method_type _q_method = &MediaBackend::trackChanged; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _q_method_type = void (MediaBackend::*)();
            if (_q_method_type _q_method = &MediaBackend::playingChanged; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _q_method_type = void (MediaBackend::*)();
            if (_q_method_type _q_method = &MediaBackend::progressChanged; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->songTitle(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->songArtist(); break;
        case 2: *reinterpret_cast< bool*>(_v) = _t->isPlaying(); break;
        case 3: *reinterpret_cast< double*>(_v) = _t->progress(); break;
        case 4: *reinterpret_cast< QString*>(_v) = _t->positionTime(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->durationTime(); break;
        default: break;
        }
    }
}

const QMetaObject *MediaBackend::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MediaBackend::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ZN12MediaBackendE.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int MediaBackend::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 8;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    }
    return _id;
}

// SIGNAL 0
void MediaBackend::trackChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void MediaBackend::playingChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void MediaBackend::progressChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}
QT_WARNING_POP
