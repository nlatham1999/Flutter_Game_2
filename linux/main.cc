#include "monster_mazelication.h"

int main(int argc, char** argv) {
  g_autoptr(MyApplication) app = monster_mazelication_new();
  return g_application_run(G_APPLICATION(app), argc, argv);
}
