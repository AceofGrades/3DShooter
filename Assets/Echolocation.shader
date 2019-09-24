 Shader "Custom/Echo Projector"
{
    Properties
    {
        _Color ("Main Color", Color) = (0.1,0.1,0.1,0)      
        _ShadowTex ("Cookie", 2D) = "" { TexGen ObjectLinear }
        _FalloffTex ("FallOff", 2D) = "" { TexGen ObjectLinear }
    }
   
    Subshader
    {
        Pass
        {
         
            ZWrite Off
            Color [_Color]
            Blend One One // Use additive blending to make rendering order independent
			Offset -1, -1
           
            SetTexture [_ShadowTex]
            {
                combine texture * primary, ONE - texture
                Matrix [_Projector]
            }
           
            SetTexture [_FalloffTex]
            {
                constantColor (0,0,0,0)
                combine previous lerp (texture) constant
                Matrix [_ProjectorClip]
            }
        }
    }
}
 
