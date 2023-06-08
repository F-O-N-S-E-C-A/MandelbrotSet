# MandelbrotSet
A visualisation of the MandelbrotSet in Processing

The Mandelbrot set is a captivating mathematical set named after Benoit Mandelbrot. It consists of complex numbers and showcases intricate fractal patterns. By iterating a simple formula, it determines whether a complex number is part of the set. The boundary of the set, known as the "edge of chaos," reveals mesmerizing self-similar structures at different scales. Zooming in uncovers a world of intricate shapes and filaments. The Mandelbrot set has inspired art, computer graphics, and music, highlighting the captivating beauty that arises from basic iterative processes.

<img src="https://github.com/F-O-N-S-E-C-A/MandelbrotSet/blob/main/image.png" width="800">
<img src="https://github.com/F-O-N-S-E-C-A/MandelbrotSet/blob/main/img_pattern_1.png" width="800">


## Instructions
Use the following controls to interact with the visualization:

- Arrow keys: Zoom in (+) and out (-) based on the current mouse position.
- W key: Move the fractal up.
- S key: Move the fractal down.
- A key: Move the fractal to the left.
- D key: Move the fractal to the right.
- C key: Increase the base color value.
- H key: Toggle the iterative change of hue in the fractal.
- T key: Show tricorn Mandelbrot set variant.
- B key: Show Burning Ship Fractal.
- Mouse wheel: Zoom in (+) and out (-) based on the mouse position.
- Mouse drag: Move the fractal based on the mouse movement.

### Mandelbrot set

- next_a = a*a - b*b;
- next_b = 2*a*b;


### Tricorn Mandelbrot set variant 

- next_a = a*a - b*b;
- next_b = -2*a*b;

<img src="https://github.com/F-O-N-S-E-C-A/MandelbrotSet/blob/main/img_tricorn.png" width="500">


### Burning ship fractal

- next_a = abs(a*a - b*b);
- next_b = abs(-2*a*b);

<img src="https://github.com/F-O-N-S-E-C-A/MandelbrotSet/blob/main/burning_ship.png" width="500">
