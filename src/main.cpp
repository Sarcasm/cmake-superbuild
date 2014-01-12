#include <iostream>
#include <boost/any.hpp>

int main() {
  // New in Boost 1.55
  boost::any foo = 42;
  foo.clear();

  std::cout << "Hello world!" << std::endl;
  return 0;
}
