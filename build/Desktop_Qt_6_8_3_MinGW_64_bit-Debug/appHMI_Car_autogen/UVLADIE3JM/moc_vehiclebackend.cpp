/****************************************************************************
** Meta object code from reading C++ file 'vehiclebackend.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.8.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../src/vehiclebackend.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'vehiclebackend.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN14VehicleBackendE_t {};
} // unnamed namespace


#ifdef QT_MOC_HAS_STRINGDATA
static constexpr auto qt_meta_stringdata_ZN14VehicleBackendE = QtMocHelpers::stringData(
    "VehicleBackend",
    "batteryLevelChanged",
    "",
    "speedChanged",
    "rangeChanged",
    "isDrivingChanged",
    "updateSimulation",
    "setIsDriving",
    "driving",
    "batteryLevel",
    "speed",
    "range",
    "isDriving"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA

Q_CONSTINIT static const uint qt_meta_data_ZN14VehicleBackendE[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       4,   58, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   50,    2, 0x06,    5 /* Public */,
       3,    0,   51,    2, 0x06,    6 /* Public */,
       4,    0,   52,    2, 0x06,    7 /* Public */,
       5,    0,   53,    2, 0x06,    8 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       6,    0,   54,    2, 0x08,    9 /* Private */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       7,    1,   55,    2, 0x02,   10 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::Bool,    8,

 // properties: name, type, flags, notifyId, revision
       9, QMetaType::Int, 0x00015103, uint(0), 0,
      10, QMetaType::Int, 0x00015103, uint(1), 0,
      11, QMetaType::Int, 0x00015103, uint(2), 0,
      12, QMetaType::Bool, 0x00015103, uint(3), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject VehicleBackend::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_ZN14VehicleBackendE.offsetsAndSizes,
    qt_meta_data_ZN14VehicleBackendE,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_tag_ZN14VehicleBackendE_t,
        // property 'batteryLevel'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'speed'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'range'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'isDriving'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<VehicleBackend, std::true_type>,
        // method 'batteryLevelChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'speedChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'rangeChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'isDrivingChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'updateSimulation'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'setIsDriving'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>
    >,
    nullptr
} };

void VehicleBackend::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<VehicleBackend *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->batteryLevelChanged(); break;
        case 1: _t->speedChanged(); break;
        case 2: _t->rangeChanged(); break;
        case 3: _t->isDrivingChanged(); break;
        case 4: _t->updateSimulation(); break;
        case 5: _t->setIsDriving((*reinterpret_cast< std::add_pointer_t<bool>>(_a[1]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _q_method_type = void (VehicleBackend::*)();
            if (_q_method_type _q_method = &VehicleBackend::batteryLevelChanged; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _q_method_type = void (VehicleBackend::*)();
            if (_q_method_type _q_method = &VehicleBackend::speedChanged; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _q_method_type = void (VehicleBackend::*)();
            if (_q_method_type _q_method = &VehicleBackend::rangeChanged; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _q_method_type = void (VehicleBackend::*)();
            if (_q_method_type _q_method = &VehicleBackend::isDrivingChanged; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->batteryLevel(); break;
        case 1: *reinterpret_cast< int*>(_v) = _t->speed(); break;
        case 2: *reinterpret_cast< int*>(_v) = _t->range(); break;
        case 3: *reinterpret_cast< bool*>(_v) = _t->isDriving(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setBatteryLevel(*reinterpret_cast< int*>(_v)); break;
        case 1: _t->setSpeed(*reinterpret_cast< int*>(_v)); break;
        case 2: _t->setRange(*reinterpret_cast< int*>(_v)); break;
        case 3: _t->setIsDriving(*reinterpret_cast< bool*>(_v)); break;
        default: break;
        }
    }
}

const QMetaObject *VehicleBackend::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *VehicleBackend::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ZN14VehicleBackendE.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int VehicleBackend::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
        _id -= 4;
    }
    return _id;
}

// SIGNAL 0
void VehicleBackend::batteryLevelChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void VehicleBackend::speedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void VehicleBackend::rangeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void VehicleBackend::isDrivingChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}
QT_WARNING_POP
