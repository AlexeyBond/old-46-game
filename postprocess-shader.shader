shader_type canvas_item;

uniform float threshold: hint_range(0, 1) = 0.5;
uniform float edge: hint_range(0, .2) = 0.1;
uniform vec4 color1: hint_color = vec4(1,0,0,1);
uniform vec4 color2: hint_color = vec4(0,1,0,1);
uniform vec4 color3: hint_color = vec4(0,0,1,1);
uniform vec4 color_bg: hint_color = vec4(0,0,0,1);

void fragment() {
    vec3 sample = smoothstep(
		vec3(threshold - edge),
		vec3(threshold),
		texture(SCREEN_TEXTURE, SCREEN_UV).rgb
	);
	vec4 c = color_bg;
	c = mix(c, color1, vec4(sample.r));
	c = mix(c, color2, vec4(sample.g));
	c = mix(c, color3, vec4(sample.b));
	
    COLOR = c;
}
