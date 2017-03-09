trigger helloWorldAccountTrigger on Account (before insert, before update) {
Account[] accs = Trigger.new;
MyHelloWorld.addHelloWorld(accs);
}