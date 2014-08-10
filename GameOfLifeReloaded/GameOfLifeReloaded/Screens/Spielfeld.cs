#region Usings

using System;
using System.Collections.Generic;
using System.Text;
using FlatRedBall;
using FlatRedBall.Input;
using FlatRedBall.Instructions;
using FlatRedBall.AI.Pathfinding;
using FlatRedBall.Graphics.Animation;
using FlatRedBall.Graphics.Particle;

using FlatRedBall.Graphics.Model;
using FlatRedBall.Math.Geometry;
using FlatRedBall.Math.Splines;

using Cursor = FlatRedBall.Gui.Cursor;
using GuiManager = FlatRedBall.Gui.GuiManager;
using FlatRedBall.Localization;

#if FRB_XNA || SILVERLIGHT
using Keys = Microsoft.Xna.Framework.Input.Keys;
using Vector3 = Microsoft.Xna.Framework.Vector3;
using Texture2D = Microsoft.Xna.Framework.Graphics.Texture2D;
#endif
#endregion

namespace GameOfLifeReloaded.Screens
{
	public partial class Spielfeld
	{

		void CustomInitialize()
		{
            const int rectangleWidth = 16;
            const int rectangleHeight = 16;
            
            float numberOfRectangles = (FlatRedBallServices.GraphicsOptions.ResolutionHeight / rectangleHeight)
                * (FlatRedBallServices.GraphicsOptions.ResolutionWidth / rectangleWidth);

            float numberOfRectanglesX = (FlatRedBallServices.GraphicsOptions.ResolutionWidth / rectangleWidth);
            float numberOfRectanglesY = (FlatRedBallServices.GraphicsOptions.ResolutionHeight / rectangleHeight);

            /*// Let's spread out the rectangles
                    const float minBoundary = -3000;
                    const float range = 6000;*/

            AxisAlignedRectangle newRectangle = new AxisAlignedRectangle();
            newRectangle.Visible = true;
            newRectangle.X = 0;

            newRectangle.Y = 0;

            newRectangle.Width = rectangleWidth;
            newRectangle.Height = rectangleHeight;

            Cells.AxisAlignedRectangles.Add(newRectangle);

            /*for (int x = 0; x < numberOfRectanglesX ; x++)
            {
                for (int y = 0; y < numberOfRectanglesY ; y++)
                {

                    

                    AxisAlignedRectangle newRectangle = new AxisAlignedRectangle();
                    newRectangle.Visible = true;
                    newRectangle.X = (x * rectangleWidth) + rectangleWidth ;

                    newRectangle.Y = (y * rectangleHeight) + rectangleHeight ;

                    newRectangle.Width = rectangleWidth;
                    newRectangle.Height = rectangleHeight;

                    Cells.AxisAlignedRectangles.Add(newRectangle);
                }
            }*/

		}

		void CustomActivity(bool firstTimeCalled)
		{
            string resultStringX = "MouseX: " + InputManager.Mouse.X;
            string resultStringY = "MouseY: " + InputManager.Mouse.Y;

            FlatRedBall.Debugging.Debugger.Write(resultStringX + "\n" + resultStringY);    
		}

		void CustomDestroy()
		{


		}

        static void CustomLoadStaticContent(string contentManagerName)
        {


        }

	}
}
