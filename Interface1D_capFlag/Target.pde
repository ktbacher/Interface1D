// This is the target that players need to catch.
// The 'explosion' animation could happen here rather than the state machine.


class Target {

  color targetColor;
  int position;


  Target(color _c, int _position) {
    targetColor = _c;
    position = _position;
  }

}
