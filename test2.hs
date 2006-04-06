import System.Time
import qualified Graphics.Rendering.Cairo as C
import Chart
import GtkChart

prices = [
    (03,05,2005, 16.18, 42.02),
    (04,05,2005, 16.25, 42.31),
    (05,05,2005, 16.50, 42.95),
    (06,05,2005, 16.52, 43.50),
    (09,05,2005, 16.84, 44.91),
    (10,05,2005, 16.70, 44.55),
    (11,05,2005, 16.43, 43.63),
    (12,05,2005, 16.29, 43.18),
    (13,05,2005, 15.95, 42.40),
    (16,05,2005, 15.55, 41.65),
    (17,05,2005, 15.71, 42.17),
    (18,05,2005, 15.93, 42.37),
    (19,05,2005, 16.20, 42.85),
    (20,05,2005, 15.88, 42.30),
    (23,05,2005, 15.92, 42.53),
    (24,05,2005, 16.25, 42.81),
    (25,05,2005, 16.20, 42.67),
    (26,05,2005, 16.05, 42.35),
    (27,05,2005, 16.45, 43.12),
    (30,05,2005, 16.85, 43.24),
    (31,05,2005, 16.68, 42.57),
    (01,06,2005, 16.85, 43.22),
    (02,06,2005, 17.17, 43.85),
    (03,06,2005, 17.42, 44.15),
    (06,06,2005, 17.50, 44.07),
    (07,06,2005, 17.37, 43.76),
    (08,06,2005, 17.15, 43.21),
    (09,06,2005, 17.12, 43.42),
    (10,06,2005, 17.15, 43.27),
    (14,06,2005, 17.34, 43.30),
    (15,06,2005, 17.46, 43.90),
    (16,06,2005, 17.71, 44.43),
    (17,06,2005, 18.25, 45.45),
    (20,06,2005, 18.23, 45.16),
    (21,06,2005, 18.26, 45.54),
    (22,06,2005, 18.11, 45.06),
    (23,06,2005, 17.79, 44.65),
    (24,06,2005, 17.76, 44.43),
    (27,06,2005, 17.63, 44.22),
    (28,06,2005, 18.08, 44.94),
    (29,06,2005, 18.13, 44.80),
    (30,06,2005, 18.15, 44.82),
    (01,07,2005, 18.09, 45.12),
    (04,07,2005, 18.20, 45.20),
    (05,07,2005, 18.45, 45.85),
    (06,07,2005, 18.40, 45.91),
    (07,07,2005, 18.60, 46.35),
    (08,07,2005, 18.38, 45.76),
    (11,07,2005, 18.80, 46.41),
    (12,07,2005, 18.60, 45.86),
    (13,07,2005, 18.73, 46.00),
    (14,07,2005, 18.70, 46.44),
    (15,07,2005, 18.67, 46.25),
    (18,07,2005, 18.54, 45.77),
    (19,07,2005, 18.20, 45.21),
    (20,07,2005, 18.65, 46.13),
    (21,07,2005, 19.00, 46.87),
    (22,07,2005, 19.09, 47.32),
    (25,07,2005, 19.22, 47.36),
    (26,07,2005, 19.19, 47.66),
    (27,07,2005, 19.17, 47.64),
    (28,07,2005, 19.15, 47.98),
    (29,07,2005, 19.36, 49.12),
    (01,08,2005, 19.40, 49.30),
    (02,08,2005, 19.30, 49.17),
    (03,08,2005, 19.52, 49.91),
    (04,08,2005, 19.80, 50.60),
    (05,08,2005, 19.60, 50.40),
    (08,08,2005, 19.92, 50.94),
    (09,08,2005, 20.34, 52.09),
    (10,08,2005, 20.45, 51.42),
    (11,08,2005, 20.74, 52.30),
    (12,08,2005, 21.05, 53.01),
    (15,08,2005, 21.16, 53.02),
    (16,08,2005, 20.90, 52.74),
    (17,08,2005, 20.55, 51.93),
    (18,08,2005, 20.28, 51.42),
    (19,08,2005, 20.68, 52.20),
    (22,08,2005, 21.22, 53.10),
    (23,08,2005, 21.07, 53.01),
    (24,08,2005, 20.56, 52.72),
    (25,08,2005, 19.90, 50.45),
    (26,08,2005, 20.60, 51.42),
    (29,08,2005, 20.03, 50.10),
    (30,08,2005, 20.47, 50.74),
    (31,08,2005, 20.46, 50.31),
    (01,09,2005, 20.93, 51.80),
    (02,09,2005, 20.83, 51.60),
    (05,09,2005, 20.46, 51.56),
    (06,09,2005, 20.25, 50.60),
    (07,09,2005, 20.55, 51.54),
    (08,09,2005, 20.03, 50.55),
    (09,09,2005, 20.19, 50.90),
    (12,09,2005, 20.20, 51.27),
    (13,09,2005, 20.47, 51.91),
    (14,09,2005, 20.59, 51.59),
    (15,09,2005, 20.70, 52.44),
    (16,09,2005, 20.99, 53.77),
    (19,09,2005, 21.39, 55.45),
    (20,09,2005, 21.53, 55.88),
    (21,09,2005, 20.89, 54.63),
    (22,09,2005, 21.41, 55.50),
    (23,09,2005, 21.30, 55.56),
    (26,09,2005, 21.86, 57.55),
    (27,09,2005, 22.01, 58.56),
    (28,09,2005, 21.81, 58.26),
    (29,09,2005, 22.48, 60.01),
    (30,09,2005, 22.25, 59.14),
    (03,10,2005, 22.30, 58.93),
    (04,10,2005, 22.20, 58.61),
    (05,10,2005, 21.45, 57.10),
    (06,10,2005, 20.76, 56.30),
    (07,10,2005, 20.47, 56.50),
    (10,10,2005, 20.72, 57.25),
    (11,10,2005, 20.33, 57.00),
    (12,10,2005, 20.83, 57.48),
    (13,10,2005, 20.47, 56.69),
    (14,10,2005, 19.98, 55.21),
    (17,10,2005, 20.05, 55.95),
    (18,10,2005, 20.75, 57.90),
    (19,10,2005, 20.05, 56.19),
    (20,10,2005, 20.01, 56.30),
    (21,10,2005, 20.03, 55.82),
    (24,10,2005, 19.77, 54.27),
    (25,10,2005, 20.09, 54.82),
    (26,10,2005, 20.42, 55.58),
    (27,10,2005, 20.49, 55.80),
    (28,10,2005, 20.10, 54.94),
    (31,10,2005, 20.75, 56.31),
    (01,11,2005, 20.89, 57.00),
    (02,11,2005, 20.70, 57.11),
    (03,11,2005, 21.28, 58.39),
    (04,11,2005, 21.35, 58.60),
    (07,11,2005, 21.09, 58.18),
    (08,11,2005, 21.35, 59.80),
    (09,11,2005, 21.03, 59.25),
    (10,11,2005, 21.11, 59.21),
    (11,11,2005, 21.12, 59.71),
    (14,11,2005, 21.60, 61.24),
    (15,11,2005, 21.53, 60.96),
    (16,11,2005, 21.42, 60.60),
    (17,11,2005, 21.40, 60.79),
    (18,11,2005, 21.85, 62.45),
    (21,11,2005, 21.71, 62.60),
    (22,11,2005, 21.67, 61.70),
    (23,11,2005, 21.55, 60.70),
    (24,11,2005, 21.86, 61.89),
    (25,11,2005, 22.02, 62.21),
    (28,11,2005, 22.22, 62.09),
    (29,11,2005, 21.83, 61.35),
    (30,11,2005, 21.87, 61.76),
    (01,12,2005, 21.50, 60.40),
    (02,12,2005, 21.95, 61.92),
    (05,12,2005, 22.03, 63.33),
    (06,12,2005, 21.83, 62.99),
    (07,12,2005, 21.85, 63.84),
    (08,12,2005, 21.56, 63.10),
    (09,12,2005, 21.80, 63.55),
    (12,12,2005, 21.92, 63.60),
    (13,12,2005, 21.65, 63.35),
    (14,12,2005, 21.72, 63.15),
    (15,12,2005, 21.69, 63.16),
    (16,12,2005, 21.60, 62.63),
    (19,12,2005, 21.87, 63.81),
    (20,12,2005, 22.10, 65.50),
    (21,12,2005, 22.50, 67.18),
    (22,12,2005, 22.49, 67.75),
    (23,12,2005, 22.58, 68.50),
    (28,12,2005, 22.59, 68.25),
    (29,12,2005, 22.93, 69.10),
    (30,12,2005, 22.75, 69.00),
    (03,01,2006, 23.18, 69.90),
    (04,01,2006, 23.85, 71.06),
    (05,01,2006, 23.60, 69.80),
    (06,01,2006, 23.35, 68.80),
    (09,01,2006, 24.06, 70.18),
    (10,01,2006, 23.85, 69.15),
    (11,01,2006, 23.88, 69.35),
    (12,01,2006, 23.80, 70.19),
    (13,01,2006, 23.73, 70.50),
    (16,01,2006, 23.74, 71.05),
    (17,01,2006, 23.96, 71.94),
    (18,01,2006, 23.73, 70.25),
    (19,01,2006, 24.45, 72.50),
    (20,01,2006, 24.66, 74.00),
    (23,01,2006, 24.47, 73.25),
    (24,01,2006, 24.84, 74.25),
    (25,01,2006, 25.08, 73.96),
    (27,01,2006, 26.05, 76.10),
    (30,01,2006, 26.58, 78.45),
    (31,01,2006, 25.80, 75.82),
    (01,02,2006, 25.99, 75.21),
    (02,02,2006, 25.50, 74.98),
    (03,02,2006, 25.53, 74.75),
    (06,02,2006, 25.85, 75.57),
    (07,02,2006, 25.70, 75.06),
    (08,02,2006, 24.37, 72.75),
    (09,02,2006, 24.68, 72.77),
    (13,02,2006, 23.88, 70.95),
    (14,02,2006, 24.16, 72.37),
    (15,02,2006, 24.35, 71.84),
    (16,02,2006, 24.29, 71.89),
    (17,02,2006, 23.88, 71.65),
    (20,02,2006, 24.54, 74.90),
    (21,02,2006, 24.98, 75.50),
    (22,02,2006, 24.90, 73.24),
    (23,02,2006, 25.28, 74.69),
    (24,02,2006, 24.55, 72.20),
    (27,02,2006, 24.66, 73.00),
    (28,02,2006, 24.25, 71.20),
    (01,03,2006, 24.03, 70.25),
    (02,03,2006, 24.45, 70.50),
    (03,03,2006, 24.34, 70.35),
    (06,03,2006, 24.51, 70.85),
    (08,03,2006, 23.60, 67.95),
    (09,03,2006, 23.70, 68.65),
    (10,03,2006, 23.37, 67.50),
    (13,03,2006, 23.93, 70.36),
    (14,03,2006, 23.64, 69.45),
    (15,03,2006, 23.90, 69.40),
    (16,03,2006, 24.46, 70.90),
    (17,03,2006, 24.70, 71.25),
    (20,03,2006, 25.24, 72.85),
    (21,03,2006, 25.32, 73.08),
    (22,03,2006, 25.18, 72.99),
    (23,03,2006, 25.57, 74.34),
    (24,03,2006, 25.92, 75.23),
    (27,03,2006, 26.78, 77.05),
    (28,03,2006, 26.85, 77.13),
    (30,03,2006, 27.60, 77.96),
    (31,03,2006, 28.00, 78.85)
    ]

fromYMD :: Int -> Int -> Int -> ClockTime
fromYMD yyyy mm dd = toClockTime CalendarTime {
    ctYear=yyyy,
    ctMonth=toEnum (mm-1),
    ctDay=dd,
    ctHour=0,
    ctMin=0,
    ctSec=0,
    ctPicosec=0,
    ctTZ=0,
    ctWDay=Monday,
    ctYDay=0,
    ctTZName="",
    ctIsDST=False
    }

chart = layout 
  where

    price1 = defaultPlotLines {
        plot_lines_style = solidLine 1 0 0 1,
	plot_lines_values = [[ Point (date d m y) v | (d,m,y,v,_) <- prices]]
    }

    price2 = defaultPlotLines {
        plot_lines_style = solidLine 1 0 1 0,
	plot_lines_values = [[ Point (date d m y) v | (d,m,y,_,v) <- prices]]
    }

    date d m y = fromIntegral (tdSec (fromYMD y m d `diffClockTimes` fromYMD 1970 01 01))

    layout = defaultLayout1 {
        layout1_title="Price History",			   
        layout1_horizontal_axes=linkedAxes' (autoScaledAxis defaultAxis),
	layout1_vertical_axes=linkedAxes' (autoScaledAxis defaultAxis),
 	layout1_plots = [(HA_Bottom,VA_Left,(PLines price1)),
                         (HA_Bottom,VA_Left,(PLines price2))]
    }

main = do
    renderableToWindow chart 640 480
