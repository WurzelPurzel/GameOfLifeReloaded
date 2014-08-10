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

            int border = 8;

            float numberOfRectangles = (FlatRedBallServices.GraphicsOptions.ResolutionHeight / rectangleHeight)
                * (FlatRedBallServices.GraphicsOptions.ResolutionWidth / rectangleWidth);

            float numberOfRectanglesX = FlatRedBallServices.GraphicsOptions.ResolutionWidth / rectangleWidth - 1;
            float numberOfRectanglesY = FlatRedBallServices.GraphicsOptions.ResolutionHeight / rectangleHeight - 1;        
           

            for (int x = 0; x < numberOfRectanglesX; x++)
            {
                for (int y = 0; y < numberOfRectanglesY; y++)
                {

                    /*// Let's spread out the rectangles
                    const float minBoundary = -3000;
                    const float range = 6000;*/

                    AxisAlignedRectangle newRectangle = new AxisAlignedRectangle();
                    newRectangle.Visible = true;
                    newRectangle.X = (x * rectangleWidth) - (FlatRedBallServices.GraphicsOptions.ResolutionWidth / 2) + border;

                    newRectangle.Y = (y * rectangleHeight) - (FlatRedBallServices.GraphicsOptions.ResolutionHeight / 2) + border;

                    newRectangle.Width = rectangleWidth;
                    newRectangle.Height = rectangleHeight;

                    Cells.AxisAlignedRectangles.Add(newRectangle);
                }
            }

		}

		void CustomActivity(bool firstTimeCalled)
		{


		}

		void CustomDestroy()
		{


		}

        static void CustomLoadStaticContent(string contentManagerName)
        {


        }

	}
}
