#ifndef FLUTTER_monster_mazeLICATION_H_
#define FLUTTER_monster_mazeLICATION_H_

#include <gtk/gtk.h>

G_DECLARE_FINAL_TYPE(MyApplication, monster_mazelication, MY, APPLICATION,
                     GtkApplication)

/**
 * monster_mazelication_new:
 *
 * Creates a new Flutter-based application.
 *
 * Returns: a new #MyApplication.
 */
MyApplication* monster_mazelication_new();

#endif  // FLUTTER_monster_mazeLICATION_H_
