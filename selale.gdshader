shader_type spatial;
render_mode unshaded, cull_disabled, depth_draw_never, blend_mix;
// şelale (web selaleDoku/selaleMat): yukarıdan aşağı akan beyaz çizgili su şeridi
uniform sampler2D doku : repeat_enable, filter_linear;
void fragment() {
	vec4 c = texture(doku, vec2(UV.x, UV.y - TIME * 1.6));
	ALBEDO = c.rgb; ALPHA = c.a;
}
