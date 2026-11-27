shader_type spatial;
// web oyunundaki deniz: dalgalar, kıyıya yaklaştıkça sığ renk ve köpük
uniform sampler2D kara : filter_linear;
uniform float yari = 63.0;
uniform float n_boy = 126.0;
varying vec3 wp;
varying float dalga;
void vertex() {
	vec2 w = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xz;
	float kv = texture(kara, (w + yari) / n_boy).r;
	float A = mix(0.16, 0.02, smoothstep(0.0, 0.5, kv));
	float t = TIME;
	float d1 = sin(dot(w, vec2(0.36, 0.22)) - t * 1.25);
	float d2 = sin(dot(w, vec2(-0.18, 0.41)) - t * 1.05 + 1.7);
	float d3 = sin(dot(w, vec2(0.61, -0.47)) - t * 1.9);
	float h = d1 * 0.55 + d2 * 0.35 + d3 * 0.18;
	VERTEX.y += h * A;
	dalga = h * smoothstep(0.5, 0.0, kv);
	wp = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
}
void fragment() {
	float kk = texture(kara, (wp.xz + yari) / n_boy).r;
	vec3 c = vec3(0.114, 0.31, 0.376);
	c = mix(vec3(0.05, 0.19, 0.30), c, smoothstep(0.0, 0.12, kk) * 0.6 + 0.4);
	c = mix(c, vec3(0.10, 0.36, 0.33), smoothstep(0.08, 0.5, kk));
	float t = TIME; vec2 p = wp.xz;
	float n = sin(p.x * 2.3 + sin(p.y * 1.7 + t * 0.6) * 1.4) * sin(p.y * 2.1 - t * 0.5 + sin(p.x * 1.3) * 1.2);
	float bant = smoothstep(0.3, 0.62, kk) * (1.0 - smoothstep(0.62, 0.75, kk));
	float dk = smoothstep(0.55, 1.0, sin(kk * 34.0 - t * 1.6 + n * 1.2)) * bant;
	float kopuk = max(dk * 0.85, smoothstep(0.5, 0.66, kk) * (0.55 + 0.35 * n));
	kopuk += smoothstep(0.78, 1.0, dalga) * smoothstep(0.4, 1.0, n) * 0.6;
	c = mix(c, vec3(0.93, 0.96, 0.96), clamp(kopuk, 0.0, 0.9));
	ALBEDO = c;
	ROUGHNESS = 0.07;
	float dx = cos(p.x*1.7+t*1.2)*0.05 + cos(p.x*3.1+p.y*2.3+t*1.9)*0.035 + cos((p.x+p.y)*6.3-t*2.4)*0.02;
	float dz = cos(p.y*1.9+t*1.0)*0.05 + cos(p.y*3.7-p.x*1.3+t*1.6)*0.035 + cos((p.y-p.x)*7.1+t*2.0)*0.02;
	NORMAL = normalize((VIEW_MATRIX * vec4(normalize(vec3(-dx, 1.0, -dz)), 0.0)).xyz);
}
