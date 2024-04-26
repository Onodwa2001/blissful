-- CreateTable
CREATE TABLE `Question` (
    `questionId` VARCHAR(191) NOT NULL,
    `question` VARCHAR(191) NOT NULL,
    `answers` JSON NOT NULL,

    PRIMARY KEY (`questionId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Session` (
    `sessionId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Session_userId_key`(`userId`),
    PRIMARY KEY (`sessionId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_sessionQuestion` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_sessionQuestion_AB_unique`(`A`, `B`),
    INDEX `_sessionQuestion_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Session` ADD CONSTRAINT `Session_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_sessionQuestion` ADD CONSTRAINT `_sessionQuestion_A_fkey` FOREIGN KEY (`A`) REFERENCES `Question`(`questionId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_sessionQuestion` ADD CONSTRAINT `_sessionQuestion_B_fkey` FOREIGN KEY (`B`) REFERENCES `Session`(`sessionId`) ON DELETE CASCADE ON UPDATE CASCADE;
