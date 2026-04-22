/****************************************************************************
** Meta object code from reading C++ file 'climatebackend.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.8.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../src/climatebackend.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'climatebackend.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN14ClimateBackendE_t {};
} // unnamed namespace


#ifdef QT_MOC_HAS_STRINGDATA
static constexpr auto qt_meta_stringdata_ZN14ClimateBackendE = QtMocHelpers::stringData(
    "ClimateBackend",
    "leftTempChanged",
    "",
    "rightTempChanged",
    "increaseLeftTemp",
    "decreaseLeftTemp",
    "increaseRightTemp",
    "decreaseRightTemp",
    "leftTemp",
    "rightTemp"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA

Q_CONSTINIT static const uint qt_meta_data_ZN14ClimateBackendE[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       2,   56, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   50,    2, 0x06,    3 /* Public */,
       3,    0,   51,    2, 0x06,    4 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       4,    0,   52,    2, 0x02,    5 /* Public */,
       5,    0,   53,    2, 0x02,    6 /* Public */,
       6,    0,   54,    2, 0x02,    7 /* Public */,
       7,    0,   55,    2, 0x02,    8 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags, notifyId, revision
       8, QMetaType::Int, 0x00015903, uint(0), 0,
       9, QMetaType::Int, 0x00015903, uint(1), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject ClimateBackend::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_ZN14ClimateBackendE.offsetsAndSizes,
    qt_meta_data_ZN14ClimateBackendE,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_tag_ZN14ClimateBackendE_t,
        // property 'leftTemp'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'rightTemp'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<ClimateBackend, std::true_type>,
        // method 'leftTempChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'rightTempChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'increaseLeftTemp'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'decreaseLeftTemp'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'increaseRightTemp'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'decreaseRightTemp'
        QtPrivate::TypeAndForceComplete<void, std::false_type>
    >,
    nullptr
} };

void ClimateBackend::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<ClimateBackend *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->leftTempChanged(); break;
        case 1: _t->rightTempChanged(); break;
        case 2: _t->increaseLeftTemp(); break;
        case 3: _t->decreaseLeftTemp(); break;
        case 4: _t->increaseRightTemp(); break;
        case 5: _t->decreaseRightTemp(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _q_method_type = void (ClimateBackend::*)();
            if (_q_method_type _q_method = &ClimateBackend::leftTempChanged; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _q_method_type = void (ClimateBackend::*)();
            if (_q_method_type _q_method = &ClimateBackend::rightTempChanged; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->leftTemp(); break;
        case 1: *reinterpret_cast< int*>(_v) = _t->rightTemp(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setLeftTemp(*reinterpret_cast< int*>(_v)); break;
        case 1: _t->setRightTemp(*reinterpret_cast< int*>(_v)); break;
        default: break;
        }
    }
}

const QMetaObject *ClimateBackend::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ClimateBackend::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ZN14ClimateBackendE.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ClimateBackend::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 6;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void ClimateBackend::leftTempChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void ClimateBackend::rightTempChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}
QT_WARNING_POP
