abstract class AppEvent{
  const AppEvent();
}
class TriggerEvent extends AppEvent{
  final int index;
   const TriggerEvent(this.index):super();

}