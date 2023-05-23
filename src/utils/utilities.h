#ifndef UTILITY_H
#define UTILITY_H

#include <type_traits>

namespace dukto {

template<typename E>
constexpr typename std::underlying_type<E>::type toUType(E enumerator) noexcept
{
    return static_cast<typename std::underlying_type<E>::type>(enumerator);
}

}

#endif // UTILITY_H
