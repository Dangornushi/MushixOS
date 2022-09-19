#include <cstdint>
#include "frame_buffer_config.hpp"

struct PixelColor {
    uint8_t r, g, b;
};

int WritePixel(const FrameBufferConfig &config, int x, int y, const PixelColor &c) {
    const int pixelPosition = config.pixelsPerScanLine * y + x;

    if (config.pixelFormat == kPixelRGBResv8BitPerColor) {
        uint8_t *p = &config.frameBuffer[4 * pixelPosition];
        p[0]       = c.r;
        p[1]       = c.g;
        p[2]       = c.b;
        return 0;
    } else if (config.pixelFormat == kPixelBGRResv8BitPerColor) {
        uint8_t *p = &config.frameBuffer[4 * pixelPosition];
        p[0]       = c.b;
        p[1]       = c.g;
        p[2]       = c.r;
        return 0;
    }
    return -1;
}

extern "C" void KernelMain(const FrameBufferConfig &frameBufferConfig) {
    for (int x = 0; x < frameBufferConfig.horizontalResolution; ++x) {
        for (int y = 0; y < frameBufferConfig.verticalResolution; ++y) {
            WritePixel(frameBufferConfig, x, y, {0, 255, 0});
        }
    }

    while (1)
        __asm__("hlt");
}
