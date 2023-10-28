shader_type canvas_item;
uniform float contrast;

void fragment(){
	vec3 Sprite = texture(TEXTURE, UV, 0.0).rgb;
	Sprite.rgb = mix(vec3(0.5),Sprite.rgb,contrast);
	COLOR.rgb = Sprite;
}