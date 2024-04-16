// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Basic03"
{
	Properties
	{
		_c("c", 2D) = "white" {}
		_d("d", 2D) = "white" {}
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_TextureSample1("Texture Sample 1", 2D) = "white" {}
		_Float0("Float 0", Range( 0 , 100)) = 45
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull Back
		ZWrite Off
		Blend One One
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _TextureSample0;
		uniform sampler2D _TextureSample1;
		uniform sampler2D _d;
		uniform sampler2D _c;
		uniform float _Float0;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 panner6 = ( 1.0 * _Time.y * float2( 0.1,0.2 ) + i.uv_texcoord);
			float4 tex2DNode4 = tex2D( _TextureSample0, panner6 );
			float2 panner9 = ( 1.0 * _Time.y * float2( -0.1,-0.15 ) + i.uv_texcoord);
			float4 tex2DNode7 = tex2D( _TextureSample1, panner9 );
			float cos16 = cos( 1.0 * _Time.y );
			float sin16 = sin( 1.0 * _Time.y );
			float2 rotator16 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos16 , -sin16 , sin16 , cos16 )) + float2( 0.5,0.5 );
			float cos14 = cos( -1.0 * _Time.y );
			float sin14 = sin( -1.0 * _Time.y );
			float2 rotator14 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos14 , -sin14 , sin14 , cos14 )) + float2( 0.5,0.5 );
			o.Emission = ( ( ( ( tex2DNode4.r * tex2DNode7.g ) * ( tex2DNode4.g * tex2DNode7.r ) ) * ( tex2D( _d, rotator16 ) * tex2D( _c, rotator14 ) ) ) * _Float0 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16700
0;0;1920;1019;525.3641;414.3734;1.391447;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-298.5782,-47.30481;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;8;-296.5782,206.6952;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;6;25.42175,-47.30481;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,0.2;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;13;-296.5757,780.2234;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;15;-291.3286,495.7532;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;9;27.42169,206.6952;Float;True;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.1,-0.15;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;16;1.341583,477.3115;Float;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;7;299.4218,177.6952;Float;True;Property;_TextureSample1;Texture Sample 1;4;0;Create;True;0;0;False;0;1bbd9e4dbb3685248809a89dc58a01fe;1bbd9e4dbb3685248809a89dc58a01fe;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;301.4218,-76.30481;Float;True;Property;_TextureSample0;Texture Sample 0;3;0;Create;True;0;0;False;0;1bbd9e4dbb3685248809a89dc58a01fe;1bbd9e4dbb3685248809a89dc58a01fe;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RotatorNode;14;-3.70173,747.9066;Float;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;-1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;677.438,184.1623;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;315.1418,475.7197;Float;True;Property;_d;d;2;0;Create;True;0;0;False;0;5a97b28aa21def443923797afd7da7dd;5a97b28aa21def443923797afd7da7dd;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;315.2277,737.8684;Float;True;Property;_c;c;1;0;Create;True;0;0;False;0;6779dd3b17badc743ae97d117caaa890;6779dd3b17badc743ae97d117caaa890;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;679.6217,-48.30479;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;955.6382,72.36234;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;951.6568,477.894;Float;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;1333.609,295.2646;Float;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;20;1273.777,519.288;Float;True;Property;_Float0;Float 0;5;0;Create;True;0;0;False;0;45;0;0;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;1650.859,428.8434;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1882.146,379.782;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;Basic03;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;False;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;4;1;False;-1;1;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;0;5;0
WireConnection;9;0;8;0
WireConnection;16;0;15;0
WireConnection;7;1;9;0
WireConnection;4;1;6;0
WireConnection;14;0;13;0
WireConnection;11;0;4;2
WireConnection;11;1;7;1
WireConnection;3;1;16;0
WireConnection;1;1;14;0
WireConnection;10;0;4;1
WireConnection;10;1;7;2
WireConnection;12;0;10;0
WireConnection;12;1;11;0
WireConnection;17;0;3;0
WireConnection;17;1;1;0
WireConnection;19;0;12;0
WireConnection;19;1;17;0
WireConnection;21;0;19;0
WireConnection;21;1;20;0
WireConnection;0;2;21;0
ASEEND*/
//CHKSM=33DEB113EE5D77E0C045E2ED7AB0617B9B0AF97B