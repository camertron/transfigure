#include "ruby.h"

/* Copy/pasted from rbasic.h. We have to define our own copy of RBasic in order to
 * remove the const annotation from the klass field, which is (rightly) marked as
 * const in the original. We then force-cast the original RBasic into TFRBasic,
 * which removes klass' const-ness. Now that the field is no longer const, it can
 * be set easily.
 *
 * Forgive me father, for I have sinned.
*/
struct RUBY_ALIGNAS(SIZEOF_VALUE) TFRBasic {
    VALUE flags;
    VALUE klass;
};

VALUE tf_transfigure_into_bang(VALUE self, VALUE target_klass) {
    ((struct TFRBasic*)RBASIC(self))->klass = target_klass;
    return Qnil;
}

void Init_transfigure() {
    rb_define_method(rb_cObject, "transfigure_into!", RUBY_METHOD_FUNC(tf_transfigure_into_bang), 1);
}
