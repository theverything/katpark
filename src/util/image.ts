export interface Dimensions {
  width: number;
  height: number;
}

export function maxWidth(
  max: number,
  { width, height }: Dimensions
): Dimensions {
  const ratio = height / width;

  return { width: max, height: max * ratio };
}

export function maxHeight(
  max: number,
  { width, height }: Dimensions
): Dimensions {
  const ratio = width / height;

  return { width: max * ratio, height: max };
}
