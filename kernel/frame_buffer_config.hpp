#pragma once

#include <stdint.h>

enum PixelFormat {
    kPixelRGBResv8BitPerColor,
    kPixelBGRResv8BitPerColor,
};

struct FrameBufferConfig {
    uint8_t         *frameBuffer;
    uint32_t         pixelsPerScanLine;
    uint32_t         horizontalResolution;
    uint32_t         verticalResolution;
    enum PixelFormat pixelFormat;
};
