shader_type canvas_item;

uniform float video_opacity : hint_range(0.0, 1.0) = 0.5;

void fragment() {

    vec4 video_pixel = texture(TEXTURE, UV);
    
    COLOR = vec4(video_pixel.rgb, video_opacity);
}