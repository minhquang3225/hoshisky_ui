class Dog {
  String name;
  int age;

  Dog(this.name, this.age);

  void bark() {
    print('$name says Woof!');
  }

  void fetch(String item) {
    print('$name fetched the $item!');
  }
  
  void sit() {
    print('$name is sitting.');
  }
  
  void rollOver() {
    print('$name rolled over.');
  }
  
  void play() {
    print('$name is playing.');
  }
  
  void eat(String food) {
    print('$name is eating $food.');
  }
  
  void sleep() {
    print('$name is sleeping.');
  }
  
  void wagTail() {
    print('$name is wagging its tail.');
  }
  
  void barkLoudly() {
    print('$name barks loudly!');
  }
  
  void barkSoftly() {
    print('$name barks softly.');
  }
  
  void jump() {
    print('$name jumped!');
  }
  
  void dig() {
    print('$name is digging.');
  }
  
  void chase(String item) {
    print('$name is chasing the $item!');
  }
  
  void growl() {
    print('$name is growling.');
  }
  
  void howl() {
    print('$name is howling.');
  }
}