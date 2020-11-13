import 'package:reflectable/reflectable.dart';

class Reflector extends Reflectable {
  const Reflector()
      : super(invokingCapability, typingCapability, reflectedTypeCapability,
            declarationsCapability, typeRelationsCapability);
}

const reflector = Reflector();
